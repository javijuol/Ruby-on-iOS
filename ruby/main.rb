#
#  main.rb
#  Ruby on iOS
#
#  Created by Javier Juan on 14/10/16.
#  Copyright © 2016 Javier Juan. All rights reserved.
#

# force "require" reload files each time
module Kernel
    alias old_require require
    def require(lib)
    	if old = $LOADED_FEATURES.find{|path| path=~/#{Regexp.escape lib}(\.rb)?\z/ }
    		load old
    	else
    		old_require lib
		end
	end
end



require "test"

def reload
    test = Test.new
    result = test.single_test
    puts result
    console_log result.to_s
end
