import { VdpWidget, initializeVdpWidget } from './vdp.f7.jsx';

export default (props, { $f7 }) => {
  const title = 'Hello World';
  
  initializeVdpWidget($f7);

  return () => (
    <div id="app">
      <div class="view view-main view-init safe-areas">
        <div class="page">
          <div class="navbar">
            <div class="navbar-bg"></div>
            <div class="navbar-inner">
              <div class="title">{title}</div>
            </div>
          </div>
          <div class="toolbar toolbar-bottom">
            <div class="toolbar-inner">
              <a href="#" >Link 1</a>
              <a href="#" >Link 2</a>
            </div>
          </div>
          <div class="page-content">
            <VdpWidget label="Van der Pol Model"/>
          </div>
        </div>
      </div>
    </div>
  )
}