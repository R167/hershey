## Original file prepared in 2011 by Windell H. Oskay, www.evilmadscientist.com
##
##
## Contents adapted from emergent.unpythonic.net/software/hershey
##  by way of http://www.thingiverse.com/thing:6168
##
##The Hershey Fonts are a set of vector fonts with a liberal license.
##
##USE RESTRICTION:
##	This distribution of the Hershey Fonts may be used by anyone for
##	any purpose, commercial or otherwise, providing that:
##		1. The following acknowledgements must be distributed with
##			the font data:
##			- The Hershey Fonts were originally created by Dr.
##				A. V. Hershey while working at the U. S.
##				National Bureau of Standards.
##			- The format of the Font data in this distribution
##				was originally created by
##					James Hurt
##					Cognition, Inc.
##					900 Technology Park Drive
##					Billerica, MA 01821
##					(mit-eddie!ci-dandelion!hurt)
##		2. The font data in this distribution may be converted into
##			any other format *EXCEPT* the format distributed by
##			the U.S. NTIS (which organization holds the rights
##			to the distribution and use of the font data in that
##			particular format). Not that anybody would really
##			*want* to use their format... each point is described
##			in eight bytes as "xxx yyy:", where xxx and yyy are
##			the coordinate values as ASCII numbers.

require 'psych'

module Hershey
  FONTS = Psych.load_file(File.join(File.dirname(__FILE__), 'fonts.yaml')).freeze
end