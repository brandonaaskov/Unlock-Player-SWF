About
=====

There are two things you can do before even considering this plugin that will likely solve your security problems. The first is to [domain restrict the player](http://support.brightcove.com/en/docs/editing-settings-players-availability-tab), which will only allow playback on the domain URLs you specify. Second, to prevent subscription/paid content from playing back in a viral player, you can specify to _not_ allow viral distribution in the distribution tab when editing a player. If neither of those solve your problem, keep reading.

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

If you have a custom field setup to denote paid/subscription content vs. free content, checkout the [custom-field-checker branch](https://github.com/BrightcoveOS/Unlock-Player-SWF/tree/custom-field-checker) and/or download that version of the plugin.

Setup
=====

You can simply grab the `UnlockPlayer.swf` file from the bin-release folder and include it with your player as you normally would. If you're unfamiliar with plugins, you can [watch this support video](http://support.brightcove.com/en/docs/video-tutorial-adding-plugins-players) to brush up.eo-tutorial-adding-plugins-players) to brush up.