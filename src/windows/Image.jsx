import WindowWrapper from '@/hoc/WindowWrapper';
import { WindowControls } from '@/components';
import useWindowStore from '@/store/window';

const Image = () => {
  const {
    windows: {
      imgfile: { data },
    },
  } = useWindowStore();

  if (!data) return null;

  const imageSrc = data.imageUrl || data.image;

  return (
    <>
      <div id='window-header'>
        <WindowControls target='imgfile' />
        <h2>{data.name}</h2>
      </div>

      {imageSrc && (
        <div className='p-6'>
          <img
            src={imageSrc}
            alt={data.name}
            className='w-full h-auto object-contain rounded-xl'
          />
        </div>
      )}
    </>
  );
};

const ImageWindow = WindowWrapper(Image, 'imgfile');
export default ImageWindow;
