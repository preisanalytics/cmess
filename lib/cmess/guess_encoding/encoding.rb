#--
###############################################################################
#                                                                             #
# A component of cmess, the encoding tool-box.                                #
#                                                                             #
# Copyright (C) 2007-2008 University of Cologne,                              #
#                         Albertus-Magnus-Platz,                              #
#                         50932 Cologne, Germany                              #
#                                                                             #
# Authors:                                                                    #
#     Jens Wille <jens.wille@uni-koeln.de>                                    #
#                                                                             #
# Contributors:                                                               #
#     John Vorhauer <john@vorhauer.de> (idea and original implementation      #
#                                       for automatic encoding detection)     #
#                                                                             #
# cmess is free software; you can redistribute it and/or modify it under the  #
# terms of the GNU General Public License as published by the Free Software   #
# Foundation; either version 3 of the License, or (at your option) any later  #
# version.                                                                    #
#                                                                             #
# cmess is distributed in the hope that it will be useful, but WITHOUT ANY    #
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS   #
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more       #
# details.                                                                    #
#                                                                             #
# You should have received a copy of the GNU General Public License along     #
# with cmess. If not, see <http://www.gnu.org/licenses/>.                     #
#                                                                             #
###############################################################################
#++

# Namespace for our encodings.

module CMess::GuessEncoding::Encoding

  extend self

  def const_name_for(encoding)
    encoding.tr('-', '_').gsub(/\W/, '').upcase
  end

  def set_encoding_const(encoding, const = const_name_for(encoding))
    const_set(const, encoding.freeze)
  end

  def get_or_set_encoding_const(encoding)
    const_defined?(const = const_name_for(encoding)) ?
      const_get(const) : set_encoding_const(encoding, const)
  end

  %w[
    UNKNOWN ASCII MACINTOSH
    ISO-8859-1 ISO-8859-2 ISO-8859-15
    CP1250 CP1251 CP1252 CP850 CP852 CP856
    UTF-8 UTF-16 UTF-16BE UTF-16LE UTF-32 UTF-32BE UTF-32LE
    UTF-7 UTF-EBCDIC SCSU BOCU-1
    ANSI_X3.4 EBCDIC-AT-DE EBCDIC-US EUC-JP KOI-8 MS-ANSI SHIFT-JIS
  ].each { |encoding| set_encoding_const(encoding) }

end
