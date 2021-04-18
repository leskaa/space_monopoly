import Test2 from "./test2"
import Satelites from "./satelites"
import React, { useRef, useState, Suspense } from "react"
import { Canvas, useFrame, useThree, extend } from "@react-three/fiber"
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls"
import { Stars } from '@react-three/drei'
import Sidebar from "./sidebar"
extend({ OrbitControls })

const CameraControls = () => {
  const {
    camera,
    gl: { domElement },
  } = useThree()
  const controls = useRef()
  useFrame((state) => controls.current.update())
  
  return <orbitControls ref={controls} args={[camera, domElement]} />
}


const Test = () => (
  <>
    <Sidebar class="sidebar"></Sidebar>
    <Canvas
      colorManagement
      camera={{ position: [30, 30, 30], fov: 20, far: 10000}}
      raycaster={{ params: { Points: { threshold: 0.2 } } }}
    >
      <ambientLight />
      <CameraControls />
      {/* <spotLight position={[10, 10, 10]} angle={0.15} /> */}
      <CameraControls />
      {/* Stars package takes time, comment out when working! */}
      <Suspense fallback={null}>
        <Test2 />
        <Satelites id="points" />
        <Stars
        radius={75} // Radius of the inner sphere (default=100)
        depth={35} // Depth of area where stars should fit (default=50)
        count={5000} // Amount of stars (default=5000)
        factor={20} // Size factor (default=4)
        saturation={0.2} // Saturation 0-1 (default=0)
        fade // Faded dots (default=false)
      />
      </Suspense>
    </Canvas>
  </>    
);

export default Test;
