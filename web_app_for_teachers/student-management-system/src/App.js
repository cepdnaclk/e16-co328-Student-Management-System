import './App.css';
import Home from './pages/Home';
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
          <Route path='/home' exact component={Home}/>
        </Switch>

      </Router>
    </div>
  );
}

export default App;
