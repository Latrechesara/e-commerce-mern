import { BrowserRouter, Route, Routes } from 'react-router-dom';
import './App.css';

function App() {
  return (
    <BrowserRouter basename='/'>
      <Routes>
        <Route path="/" element={<div>sara from client</div>} />
        <Route path="/home" element={<div>Home from client</div>} />
        <Route path="/*" element={<div>Page not found from client</div>} />
      </Routes>
    </BrowserRouter>
    );
}

export default App;
