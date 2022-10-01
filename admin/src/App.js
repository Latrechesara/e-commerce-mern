import { BrowserRouter, Route, Routes } from 'react-router-dom';
import './App.css';

function App() {
  return (
    <BrowserRouter basename='/admin'>
      <Routes>
        <Route path="/" element={<div>sara from admin</div>} />
        <Route path="/singup" element={<div>singup from admin</div>} />
        <Route path="/login" element={<div>login from admin</div>} />
        <Route path="/*" element={<div>Page not found from admin</div>} />
      </Routes>
    </BrowserRouter>
    );
}

export default App;
