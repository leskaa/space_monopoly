import React, { useRef, useState, useMemo, useCallback } from "react";
import * as THREE from "three/build/three.module";
import { useFrame } from "@react-three/fiber";
var randomColor = require('randomcolor');

const Satelites = (props) => {
  // This reference will give us direct access to the mesh
  const pointsRef = useRef();
  // Set up state for the hovered and active state
  const [sats, setSats] = useState([]);
  // const [hovered, setHover] = useState(false)
  const [active, setActive] = useState(false)

  // const [hovered, setHovered] = useState(false)


  // useEffect(() => void (document.body.style.cursor = hovered ? 'pointer' : 'auto'), [hovered])

  const [positions, colors] = useMemo(() => {
    let positions = [],
      colors = [];
    ///R = 6371 (Radius of the earth in km)
    const R = 6.371
    for (let i = 0; i < 500; i++) {
    const lat =  Math.random() * 10 //Need to be recieved from the server
    const lon = Math.random() * 10
    const altitude = 1.25 //Altitude is a multipler on the coords
    // Returns a hex code for a light blue
    const rc = randomColor({
      hue: 'purple',
      luminosity: 'dark',
      format: 'rgb'
    }).replace(/[^\d,]/g, '').split(',');
    //Colors are stored as RGB and divided by 255
    // const colorRed = 255, colorGreen = 255, colorBlue = 255
    const colorRed = rc[0], colorGreen = rc[1], colorBlue = rc[2]
    positions.push((R * Math.cos(lat) * Math.cos(lon)) * altitude);    //X-AXIS
    positions.push((R * Math.sin(lat)) * altitude);    //Z-AXIS
    positions.push((R * Math.cos(lat) * Math.sin(lon)) * altitude);    //Y-AXIS
    // positions.push(0);    //X-AXIS
    // positions.push(0);    //Z-AXIS
    // positions.push(i);    //Y-AXIS
    colors.push(colorRed / 255)
    colors.push(colorGreen / 255)
    colors.push(colorBlue / 255)
    }
    return [new Float32Array(positions), new Float32Array(colors)];
  }, [1000])

  //Hover is still not working
  // const hover = useCallback((e) => {
  //   e.stopPropagation()
  //   pointsRef.current.array[e.index * 3] = 1
  //   pointsRef.current.array[e.index * 3 + 1] = 1
  //   pointsRef.current.array[e.index * 3 + 2] = 1
  //   pointsRef.current.needsUpdate = true
  // }, [])

  // const unhover = useCallback((e) => {
  //   console.log('Unhovered')
  //   pointsRef.current.array[e.index * 3] = 1
  //   pointsRef.current.array[e.index * 3 + 1] = 0.5
  //   pointsRef.current.array[e.index * 3 + 2] = 0.5
  //   pointsRef.current.needsUpdate = true
  // }, [])

  // Return view, these are regular threejs elements expressed in JSX
    // onPointerOver={(event) => hover()}
    // onPointerOut={(event) => console.log("out")}
//            // onPointerOver={() => setHovered(true)} 
          //  onPointerOut={() => setHovered(false)} */}

  return (
    <points>
      <bufferGeometry  attach="geometry">
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
            size={0.3}
            sizeAttenuation={true}
        />
    </points>
  );
};

export default Satelites;
