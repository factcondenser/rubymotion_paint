class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    window.rootViewController = navigation_controller
    window.makeKeyAndVisible

    true
  end

  private

  def window
    @window ||= UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  end

  def navigation_controller
    @navigation_controller ||= UINavigationController.alloc.initWithRootViewController(painting_controller)
  end

  def painting_controller
    @painting_controller ||= main_storyboard.instantiateInitialViewController
  end

  def main_storyboard
    @main_storyboard ||= UIStoryboard.storyboardWithName("main", bundle: nil)
  end
end
