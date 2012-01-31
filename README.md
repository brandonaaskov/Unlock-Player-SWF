About
=====

If you're looking to secure a player so that users can't simply look at the boot loader SWF that loads the player, you can use this plugin to "unlock" the player. Simply including will prevent the player from playing back on an admin.brightcove.com domain.

If you're looking to circumvent users blocking your plugins that normally do security checks, you can also use this plugin (or code within) to solve that problem. To further secure the player, you can setup the BEML so that the video player component's visibility defaults to false, like so (the visible="false" parameter is the only important part, though the rest of the BEML is included for reference):
```
<Runtime>
  <Theme name="Deluxe" style="Light"/>
  <Layout>
    <ChromelessVideoPlayer visible="false" id="videoPlayer"/>
  </Layout>
</Runtime>
```

At that point, it will be up to the plugin to "unlock" that player and set its visibility to true. That way, if someone simply blocks the plugin, all they're left with is a blank space where the player should be.


Setup
=====

You can simply download the plugin from the [downloads folder](https://github.com/BrightcoveOS/Unlock-Player-SWF/downloads) and include it with your player as you normally would. If you're unfamiliar with plugins, you can [watch this support video](http://support.brightcove.com/en/docs/video-tutorial-adding-plugins-players) to brush up.