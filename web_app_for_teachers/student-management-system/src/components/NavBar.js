import { Navbar, Container, Nav, NavDropdown } from 'react-bootstrap';

export default function NavBar(){

    return (

        <Navbar collapseOnSelect expand="lg" bg="dark" variant="dark">

            <div style={{paddingLeft: '15px'}}>
            <Navbar.Brand href="#home">Student Management System</Navbar.Brand>
            </div>

            <Container>
            
            <Navbar.Toggle aria-controls="responsive-navbar-nav" />
            <Navbar.Collapse id="responsive-navbar-nav">
                <Nav className="me-auto">
                <Nav.Link href="#addmision">Addmision</Nav.Link>
                <Nav.Link href="#attendance">Attendance</Nav.Link>
                
                </Nav>
                <Nav>

                <NavDropdown title="Payments" id="collasible-nav-dropdown">
                    <NavDropdown.Item href="#action/3.1">Action</NavDropdown.Item>
                    <NavDropdown.Item href="#action/3.2">Another action</NavDropdown.Item>
                    <NavDropdown.Item href="#action/3.3">Something</NavDropdown.Item>
                    <NavDropdown.Divider />
                    <NavDropdown.Item href="#action/3.4">Separated link</NavDropdown.Item>
                </NavDropdown>

                <Nav.Link href="#deets">More deets</Nav.Link>

                <Nav.Link eventKey={2} href="#memes">
                    Dank memes
                </Nav.Link>
                
                </Nav>

            </Navbar.Collapse>
            </Container>
        </Navbar>

    )
}

