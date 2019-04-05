require "spec_helper"

describe Array do

  describe "#to_class_attr" do

    it "returns nil if array is empty" do
      classes = []
      expect(classes.to_class_attr).to be_nil
    end

    it "returns a space separated string if array contains strings" do
      classes = ["first", "second", "third"]
      expect(classes.to_class_attr).to eql("first second third")
    end

    it "preserves existing spaces" do
      classes = ["first", "second third", "forth"]
      expect(classes.to_class_attr).to eql("first second third forth")
    end

  end

  describe "#to_style_attr" do

    it "returns nil if array is empty" do
      styles = []
      expect(styles.to_style_attr).to be_nil
    end

    it "returns a semicolon separated string if array contains strings" do
      styles = ["padding-top: 8px", "padding-right: 15px", "font-size: 12pt"]
      expect(styles.to_style_attr).to eql("padding-top: 8px; padding-right: 15px; font-size: 12pt;")
    end

    it "preserves existing semicolon" do
      styles = ["padding-top: 8px; padding-right: 15px", "font-size: 12pt"]
      expect(styles.to_style_attr).to eql("padding-top: 8px; padding-right: 15px; font-size: 12pt;")
    end

  end

end
