import ReactDOM from 'react-dom'
import React, { useRef, useState } from 'react'
import { useFrame, useThree } from '@react-three/fiber'
import * as THREE from 'three/build/three.module';

const Test2 = (props) => {
    // This reference will give us direct access to the mesh
    const mesh = useRef()
    const texture = new THREE.TextureLoader().load('https://i.ibb.co/t2XgSPX/blueOrb.jpg')
    const { gl } = useThree();
    texture.anisotropy = gl.capabilities.getMaxAnisotropy();
    // Set up state for the hovered and active state
    const [hovered, setHover] = useState(false)
    const [active, setActive] = useState(false)

    // useFrame((state, delta) => (hovered ? null: mesh.current.rotation.y += 0.0001))

    // Return view, these are regular threejs elements expressed in JSX
    return (
      <mesh
        {...props}
        ref={mesh}
        onClick={(event) => setActive(!active)}
        onPointerOver={(event) => setHover(true)}
        onPointerOut={(event) => setHover(false)}>
        <sphereBufferGeometry attach="geometry" args={[4, 64, 64]} />
        <meshStandardMaterial attach="material" map={texture} />
      </mesh>
    )
  }

export default Test2