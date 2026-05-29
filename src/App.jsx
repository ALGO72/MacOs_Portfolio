import gsap from 'gsap';
import { Draggable } from 'gsap/Draggable';

import { Dock, Navbar, Welcome } from '#components';
import { Terminal } from '#windows';
import { Finder, Resume, Safari, Text, Image, Contact, Photos } from './windows';
import { Home } from './components';

gsap.registerPlugin(Draggable);

const App = () => {
  return (
    <main>
      <Navbar />
      <Welcome />
      <Dock />
      <Terminal />
      <Safari />
      <Resume />
      <Text />
      <Image />
      <Finder />
      <Contact />
      <Home />
      <Photos />
    </main>
  );
};

export default App;
