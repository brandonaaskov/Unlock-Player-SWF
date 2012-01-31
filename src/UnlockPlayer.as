/**
 * Unlock Player SWF v1.0.0 (31 JANUARY 2012)
 *
 * REFERENCES:
 *	 Website: http://opensource.brightcove.com
 *	 Source: http://github.com/brightcoveos
 *
 * AUTHORS:
 *	 Brandon Aaskov <baaskov@brightcove.com>
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the “Software”),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, alter, merge, publish, distribute,
 * sublicense, and/or sell copies of the Software, and to permit persons to
 * whom the Software is furnished to do so, subject to the following conditions:
 *   
 * 1. The permission granted herein does not extend to commercial use of
 * the Software by entities primarily engaged in providing online video and
 * related services.
 *  
 * 2. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT ANY WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, SUITABILITY, TITLE,
 * NONINFRINGEMENT, OR THAT THE SOFTWARE WILL BE ERROR FREE. IN NO EVENT
 * SHALL THE AUTHORS, CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY WHATSOEVER, WHETHER IN AN ACTION OF
 * CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE, INABILITY TO USE, OR OTHER DEALINGS IN THE SOFTWARE.
 *  
 * 3. NONE OF THE AUTHORS, CONTRIBUTORS, NOR BRIGHTCOVE SHALL BE RESPONSIBLE
 * IN ANY MANNER FOR USE OF THE SOFTWARE.  THE SOFTWARE IS PROVIDED FOR YOUR
 * CONVENIENCE AND ANY USE IS SOLELY AT YOUR OWN RISK.  NO MAINTENANCE AND/OR
 * SUPPORT OF ANY KIND IS PROVIDED FOR THE SOFTWARE.
 */


package
{
  import com.brightcove.api.APIModules;
  import com.brightcove.api.CustomModule;
  import com.brightcove.api.components.ChromelessVideoPlayer;
  import com.brightcove.api.components.Component;
  import com.brightcove.api.events.MediaEvent;
  import com.brightcove.api.modules.ExperienceModule;
  import com.brightcove.api.modules.VideoPlayerModule;
  
  import flash.display.Sprite;
  import flash.system.ApplicationDomain;
  import flash.system.Security;
  import flash.system.System;
  
  public class UnlockPlayer extends CustomModule
  {
    private static const BRIGHTCOVE_DOMAIN:String = 'admin.brightcove.com';
    
    private var _experience:ExperienceModule;
    private var _videoPlayer:VideoPlayerModule;
    
    private var _lockPlayer:Boolean = true;
    
    public function UnlockPlayer()
    {
      trace('@project UnlockPlayer');
      trace('@author Brandon Aaskov');
      trace('@lastModified 01.31.12 1757 EST');
    }
    
    override protected function initialize():void
    {
      _experience = player.getModule(APIModules.EXPERIENCE) as ExperienceModule;
      _videoPlayer = player.getModule(APIModules.VIDEO_PLAYER) as VideoPlayerModule;
      
      _videoPlayer.addEventListener(MediaEvent.PROGRESS, onMediaProgress);
      
      
      if(_experience.getExperienceURL().indexOf(BRIGHTCOVE_DOMAIN) == -1)
      {
        _videoPlayer.setVisible(true);
        _lockPlayer = false;
      }
      else
      {
        _videoPlayer.setVisible(false);
      }
    }
    
    private function onMediaProgress(pEvent:MediaEvent):void
    {
      if(_lockPlayer)
      {
        _videoPlayer.stop(); 
      }
    }
  }
}