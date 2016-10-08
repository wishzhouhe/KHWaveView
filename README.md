#KHWaveView
###[中文版本]()
###A simply but interesting WaveView
- small volume
- pretty easy to use
- support DIY 


##Usage

1.  Download and copy the **KHWaveView** folder with the source code in it to your project.

2. Use "addToSuperView: WithFrame:" method to initialize **KHWaveView**

         KHWaveView *waveView = [KHWaveView addToSuperView:self.headerView WithFrame:CGRectMake(0, CGRectGetHeight(self.headerView.frame) - kWaveView_Height / 2 - 3, self.headerView.frame.size.width, kWaveView_Height)];

        
3. Use "wave" method to make **KHWaveView** wave
	 	
	 	[self.waveView wave];

4. Use "stop" method to make **KHWaveView** stop waving

		[self.waveView stop];


####Now you have a simply WaveView as showed below:  
![()](https://github.com/ArronZhangKH/KH_Resources/blob/master/KHWaveView_Demo01.gif?raw=true)

  
  
##Besides, you can DIY your own WaveView!
1. Change the color of the wave
	 	
	 	self.waveView.waveColor = [UIColor yellowColor];
2. Change the speed of waving

		self.waveView.waveSpeed = 15.f;
3. Change the duration of waving(When "waveTime == 0", waving will never stop)

		self.waveView.waveTime = 0.f;

####After DIY, now you get yourself a new WaveView like this:
![()](https://github.com/ArronZhangKH/KH_Resources/blob/master/KHWaveView_Demo02.gif?raw=true)   
 
   	
####Congs! So far, you already known all the methods to use KHWaveView

##Acknowledgement
- **KHWaveView** is inspired by [WXWaveView](https://github.com/WelkinXie/WXWaveView).


