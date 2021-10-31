import './App.css';
import Home from './pages/Home';
import Login from './pages/Login/login.component';
import SignUp from './pages/Login/signup.component';
import Attendance from './pages/Attendance';
import Admission from './pages/Admission';

import {
  BrowserRouter as Router,
  Switch,
  Route
} from "react-router-dom";

function App() {
  return (
    <div className="App">
      
      <Router>
        <Switch>
          <Route path="/home" exact component={Home} />
          <Route path="/admission" exact component={Admission} />
          <Route path="/attendance" exact component={Attendance} />
          <Route exact path='/' component={Login} />
          <Route path="/sign-in" component={Login} />
          <Route path="/sign-up" component={SignUp} />
        </Switch>
      </Router>

    </div>
  );
}

export default App;
