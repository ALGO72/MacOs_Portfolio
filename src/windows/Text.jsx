import WindowWrapper from '@/hoc/WindowWrapper';
import { WindowControls } from '@/components';
import useWindowStore from '@/store/window';

const Text = () => {
  const {
    windows: {
      txtfile: { data },
    },
  } = useWindowStore();

  if (!data) return null;

  const imageSrc = data.image || data.imageUrl;

  return (
    <>
      <div id='window-header'>
        <WindowControls target='txtfile' />
        <h2>{data.name}</h2>
      </div>

      <div className='p-6 space-y-4'>
        {imageSrc && (
          <div className='w-full rounded-xl overflow-hidden'>
            <img
              src={imageSrc}
              alt={data.name}
              className='w-full h-auto object-cover'
            />
          </div>
        )}

        {data.subtitle && (
          <p className='text-sm text-slate-500'>{data.subtitle}</p>
        )}

        {Array.isArray(data.description) && data.description.length > 0 && (
          <div className='space-y-3'>
            {data.description.map((paragraph, index) => (
              <p key={index} className='text-sm leading-6 text-[#4b5563]'>
                {paragraph}
              </p>
            ))}
          </div>
        )}
      </div>
    </>
  );
};

const TextWindow = WindowWrapper(Text, 'txtfile');
export default TextWindow;
