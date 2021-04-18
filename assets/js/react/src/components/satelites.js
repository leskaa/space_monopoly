import React, { useRef, useState, useMemo, useCallback } from "react";
import * as THREE from "three/build/three.module";
import { useFrame } from "@react-three/fiber";

const Satelites = (props) => {
  // This reference will give us direct access to the mesh
  const pointsRef = useRef();
  // Set up state for the hovered and active state
  const [sats, setSats] = useState([]);
  const [positions, colors] = useMemo(() => {
    let positions = [],
      colors = [];
    for (let i = 0; i < 500; i++) {
      positions.push(5 - Math.random() * 10);
      positions.push(5 - Math.random() * 10);
      positions.push(5 - Math.random() * 10);
      colors.push(0)
      colors.push(0.5)
      colors.push(0.5)
    }
    return [new Float32Array(positions), new Float32Array(colors)];
  }, [1000])

  const hover = useCallback((e) => {
    e.stopPropagation()
    pointsRef.current.array[e.index * 3].colors = 1
    pointsRef.current.array[e.index * 3 + 1].colors = 1
    pointsRef.current.array[e.index * 3 + 2].colors = 1
    pointsRef.current.needsUpdate = true
  }, [])

  const unhover = useCallback((e) => {
    pointsRef.current.array[e.index * 3] = 1
    pointsRef.current.array[e.index * 3 + 1] = 0.5
    pointsRef.current.array[e.index * 3 + 2] = 0.5
    pointsRef.current.needsUpdate = true
  }, [])

  // Return view, these are regular threejs elements expressed in JSX
  return (
    <points onPointerOver={hover} onPointerOut={unhover}>
      <bufferGeometry attach="geometry" >
        <bufferAttribute
          attachObject={["attributes", "position"]}
          count={positions.length}
          array={positions}
          itemSize={3}
        />
        <bufferAttribute
          ref={pointsRef}
          attachObject={["attributes", "color"]}
          count={colors.length / 3}
          array={colors}
          itemSize={3}
        />
      </bufferGeometry>
        <pointsMaterial
            attach="material"
            vertexColors
            size={0.25}
            sizeAttenuation={true}
        />
    </points>
  );
};

export default Satelites;
