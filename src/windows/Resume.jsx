import { useState } from 'react';
import WindowWrapper from '@/hoc/WindowWrapper';
import { WindowControls } from '@/components';
import { Download } from 'lucide-react';
import { Document, Page, pdfjs } from 'react-pdf';
import workerUrl from 'react-pdf/node_modules/pdfjs-dist/build/pdf.worker.min.mjs?url';

import 'react-pdf/dist/Page/AnnotationLayer.css';
import 'react-pdf/dist/Page/TextLayer.css';

pdfjs.GlobalWorkerOptions.workerSrc = workerUrl;

const Resume = () => {
  const [numPages, setNumPages] = useState(null);

  function onDocumentLoadSuccess({ numPages: nextNumPages }) {
    setNumPages(nextNumPages);
  }

  return (
    <>
      <div id='window-header'>
        <WindowControls target='resume' />
        <h2>Resume.pdf</h2>

        <a
          href='files/resume.pdf'
          download
          className='cursor-pointer'
          title='Download resume'
        >
          <Download className='icon' />
        </a>
      </div>

      <Document
        file='/files/resume.pdf'
        onLoadSuccess={onDocumentLoadSuccess}
        onLoadError={(err) => console.error('Document load error:', err)}
      >
        {Array.from(new Array(numPages), (_el, index) => (
          <Page
            key={`page_${index + 1}`}
            pageNumber={index + 1}
            renderTextLayer
            renderAnnotationLayer
          />
        ))}
      </Document>
    </>
  );
};

const ResumeWindow = WindowWrapper(Resume, 'resume');
export default ResumeWindow;
