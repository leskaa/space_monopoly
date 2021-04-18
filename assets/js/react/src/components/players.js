import React, { useRef, useState, useMemo, useEffect } from "react";
// import * as THREE from "three/build/three.module";
import { Canvas, mesh } from "@react-three/fiber";
// var randomColor = require('randomcolor');

const PlayerObj = (props) => {
  // This reference will give us direct access to the mesh
  console.log(props)
  const mesh = useRef();

//   const [hovered, setHover] = useState(false)
//   const [active, setActive] = useState(false)

    //   const texture = new THREE.TextureLoader().load('https://i.ibb.co/t2XgSPX/blueOrb.jpg')
    //R = 6371 (Radius of the earth in km)
    const R = 6.371
    // Returns a hex code for a light blue
    // const rc = randomColor({
    //     hue: 'green',
    //     luminosity: 'dark',
    //     format: 'rgb'
    // }).replace(/[^\d,]/g, '').split(',')
    // //Colors are stored as RGB and divided by 255
    // // const colorRed = 255, colorGreen = 255, colorBlue = 255

    // const colorRed = rc[0] / 255, 
    // colorGreen = rc[1] / 255, 
    // colorBlue = rc[2] / 255
    const x = ((R * Math.cos(props.lat) * Math.cos(props.lon))) * 1.05;    //X-AXIS
    const z = ((R * Math.sin(props.lat))) * 1.05;    //Z-AXIS
    const y = ((R * Math.cos(props.lat) * Math.sin(props.lon))) * 1.05;    //Y-AXIS

    // scale={active ? [1.5, 1.5, 1.5] : [1, 1, 1]}
    // onClick={(e) => setActive(!active)}
    // onPointerOver={(e) => setHover(true)}
    // onPointerOut={(e) => setHover(false)}
  return (
    <mesh
    position={[x, y, z]}
    ref={mesh}>
    <boxBufferGeometry attach="geometry" args={[0.5, 0.5, 0.5]} />
    <meshStandardMaterial attach="material" color='green' />
  </mesh>
  );
};

// const Players = () => (
//     <Canvas>
//         <ambientLight intensity={1} />
//         <PlayerObj lat={2} lon={2} />
//     </Canvas>
// )

export default PlayerObj;
