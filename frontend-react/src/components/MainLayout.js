import React from 'react';
import Navbar from './Navbar';

const MainLayout =({children}) =>{
    return(
        <>
        <div>
            <Navbar />
            {/* <Auth /> component */}
        </div>
        <main>{children}</main>
        </>
    )
}

export default MainLayout;