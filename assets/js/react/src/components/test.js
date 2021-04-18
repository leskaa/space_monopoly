import Test2 from "./test2"
import Satelites from "./satelites"
import PlayerObj from "./players"
import Sidebar from "./sidebar"
import React, { useRef, Suspense } from "react"
import { Canvas, useFrame, useThree, extend } from "@react-three/fiber"
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls"
import { Stars } from '@react-three/drei'

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
      raycaster={{ params: { Points: { threshold: 2 } } }}
    >
      <ambientLight intensity={0.1} />
      <CameraControls />
      <pointLight intensity={3} distance={50} position={[8, 3, 10]} />
      {/* <pointLight intensity={-0.75} position={[-6, 6, -14]} /> */}
    <Suspense fallback={null}>
      <CameraControls />
      {/* Stars package takes time, comment out when working! */}
        <Test2 />
        <Satelites />
        <PlayerObj lat={2.3} lon={5.3} />
        <PlayerObj lat={2.4} lon={4.4} />
        <PlayerObj lat={0} lon={0.95} />
        <PlayerObj lat={-0.5} lon={0.5} />
        <PlayerObj lat={-0.05} lon={0.8} />
        <PlayerObj lat={-0.5} lon={-2.45} />
        <PlayerObj lat={-2} lon={-2} />
        <PlayerObj lat={-2.2} lon={-1.3} />
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
