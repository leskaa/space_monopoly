import React, { useRef, useState, useMemo, useEffect } from "react";
// import * as THREE from "three/build/three.module";
//import { useFrame } from "@react-three/fiber";
var randomColor = require('randomcolor');

const Satelites = (props) => {
  // This reference will give us direct access to the mesh
  const pointsRef = useRef();
  // useFrame(() => pointsRef.current.update());
  // Set up state for the hovered and active state
  const [sats, setSats] = useState([]);
  // const [hovered, setHover] = useState(false)
  // const [active, setActive] = useState(false)


  // useEffect(() => void (document.body.style.cursor = hovered ? 'pointer' : 'auto'), [hovered])
  const satellitesNum = 350
  const [positions, colors] = useMemo(() => {
    let positions = [],
      colors = [];
    ///R = 6371 (Radius of the earth in km)
    const R = 6.371
    for (let i = 0; i < satellitesNum; i++) {
    const lat =  Math.random() * 10 //Need to be recieved from the server
    const lon = Math.random() * 10
    const altitude = 2 - (Math.random() / 3)//Altitude is a multipler on the coords
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
  }, [satellitesNum])

  return (
      <points ref={pointsRef}>
      <bufferGeometry attach="geometry">
        <bufferAttribute
          attachObject={["attributes", "position"]}
          count={positions.length}
          array={positions}
          itemSize={3}
        />
        <bufferAttribute
          attachObject={["attributes", "color"]}
          count={colors.length / 3}
          array={colors}
          itemSize={3}
        />
      </bufferGeometry>
        <pointsMaterial
            attach="material"
            vertexColors
            size={0.4}
            sizeAttenuation={true}
        />
    </points>

  );
};

export default Satelites;
