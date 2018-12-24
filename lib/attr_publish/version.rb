module AttrPublish
  module Version
    Major       = 1
    Minor       = 0
    Revision    = 0
    Prerelease  = nil
    Compact     = [Major, Minor, Revision, Prerelease].compact.join('.')
    Summary     = "AttrPublish v#{Compact}"
    Description = "ActiveRecord convenience methods and scopes for publishing and finding published, unpublished and returning recent or upcoming items."
    Author      = "Jurgen Jocubeit"
    Email       = "support@brightcommerce.com"
    Homepage    = "https://github.com/brightcommerce/attr_publish"
    Metadata    = {'copyright' => 'Copyright 2018 Brightcommerce, Inc. All Rights Reserved.'}
    License     = "MIT"
  end
end
