#KHWaveView
###[English Version](https://github.com/ArronZhangKH/KHWaveView#khwaveview)
###一个简单有趣的波动视图
- 体量小
- 使用极其简易
- 可进行简单的自定义


##使用方法
1. 下载并复制**KHWaveView**文件夹下的源代码到你的工程目录。
2. 使用"addToSuperView: WithFrame:" 方法初始化 **KHWaveView**

         KHWaveView *waveView = [KHWaveView addToSuperView:self.headerView WithFrame:CGRectMake(0, CGRectGetHeight(self.headerView.frame) - kWaveView_Height / 2 - 3, self.headerView.frame.size.width, kWaveView_Height)];

        
3. 调用"wave"方法来令**KHWaveView**波动起来
	 	
	 	[self.waveView wave];

4. 调用"stop"方法来令**KHWaveView**停止波动

		[self.waveView stop];


####完成以上操作后您就可以得到一个如下的波动视图:  
![()](https://github.com/ArronZhangKH/KH_Resources/blob/master/KHWaveView_Demo01.gif?raw=true)

  
  
##除此之外,你还可以进行简单的自定义!
1. 改变波纹的颜色
	 	
	 	self.waveView.waveColor = [UIColor yellowColor];
2. 改变波纹的波动速度

		self.waveView.waveSpeed = 15.f;
3. 改变波纹的波动时间(当"waveTime == 0"会一直波动,不会停下)

		self.waveView.waveTime = 0.f;

####自定义后的效果图如下:
![()](https://github.com/ArronZhangKH/KH_Resources/blob/master/KHWaveView_Demo02.gif?raw=true)   
 
   	
####恭喜! 到此,您已经掌握了KHWaveView的全部使用方法

##感谢
- 在此特别感谢[WXWaveView](https://github.com/WelkinXie/WXWaveView)的启发

