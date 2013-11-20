require "spec_helper"

describe "Maillift" do
	describe "Util" do
    let (:maillift_hash) { {"Price" => "$10.00", "RecipientPostCode" => "94131"} }
    let (:ruby_hash) { {"price" => "$10.00", "recipient_post_code" => "94131"} }

    context "converting from MailLift" do
      it "should parse empty attributes" do
        MailLift::Util.convert_attr_from_maillift("").should == ""
      end

      it "should parse single word attributes" do
        MailLift::Util.convert_attr_from_maillift("Price").should == "price"
      end

      it "should parse multi word attributes" do
        MailLift::Util.convert_attr_from_maillift("RecipientPostCode").should == "recipient_post_code"
      end

      it "should parse empty hashes" do
        MailLift::Util.convert_from_maillift({}).should == {}
      end

      it "should parse hashes" do
        MailLift::Util.convert_from_maillift(maillift_hash).should == ruby_hash
      end
    end

    context "converting to MailLift" do
      it "should parse empty attributes" do
        MailLift::Util.convert_attr_to_maillift("").should == ""
      end

      it "should parse single word attributes" do
        MailLift::Util.convert_attr_to_maillift("price").should == "Price"
      end

      it "should parse multi word attributes" do
        MailLift::Util.convert_attr_to_maillift("recipient_post_code").should == "RecipientPostCode"
      end

      it "should parse empty hashes" do
        MailLift::Util.convert_to_maillift({}).should == {}
      end

      it "should parse hashes" do
        MailLift::Util.convert_to_maillift(ruby_hash).should == maillift_hash
      end
    end

  end
end
