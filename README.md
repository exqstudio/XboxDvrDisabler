# Xbox DVR Disabler for Windows 10

Please follow [official Steam guide](https://support.steampowered.com/kb_article.php?ref=6239-DZCB-8600) in order to disable DVR in Windows 10. 

Unfortunately none of methods worked permanently for me (together with uninstalling xbox app in windows store), I had to edit registry every restart which was annoying.

If for whatever reason it also doesn't work for you, or DVR is being re-enabled on every Windows startup you can use this super simple app.

Application comes with handy installer, [DOWNLOAD HERE](https://github.com/exqstudio/XboxDvrDisabler/raw/master/dist/xboxdvrdisabler_setup.exe)

If you want to compile it by yourself remember to add task to Task Scheduler (run with highest priveledges)

![ScreenShot](screenshot.png)

![ScreenShot2](screenshot2.png)

**Why don't you just use .reg file?**

I did for long time. Then I added .reg file to startup and it asked me for admin permissions every time. Then I created few lines Lazaurs application and added scheduled task manually. And today I created app with handy installer which is doing everything for you, hassle free.