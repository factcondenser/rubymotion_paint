describe AppDelegate do
  describe "#application:didFinishLaunchingWithOptions:" do
    before do
      @app = UIApplication.sharedApplication
    end

    it "creates the ui window and ui text effects window" do
      @app.windows.size.should == 2
      @app.windows[0].should.be.instance_of UIWindow
      @app.windows[1].should.be.instance_of UITextEffectsWindow
    end

    it "sets the ui window's root view controller" do
      @app.windows[0].rootViewController.should.be.instance_of UINavigationController
    end

    it "makes the ui window key" do
      @app.windows[0].isKeyWindow.should.be.true
    end

    it "does not make the ui text effects window key" do
      @app.windows[1].isKeyWindow.should.be.false
    end
  end
end
