
require "nkf"
data = {
	"0"=>"	まる、ま	れい、れ	オウ、ゼロ、ゼ",
	"1"=>"	ひとつ、ひと、ひ		いち、い	ワン",
	"2"=>"	ふたつ、ふた、ふ		に		ツ",
	"3"=>"	みつ、み			さん、さ	スリー",
	"4"=>"	よん、よ、よつ			し		フォー",
	"5"=>"	いつつ、いつ			ご、こ		ファイブ、ファイヴ",
	"6"=>"	むつ、む			ろく、ろ	シックス",
	"7"=>"	ななつ、なな、な		しち		セブン、セヴン",
	"8"=>"	やつ、や			はち、は、ば	エート",
	"9"=>"	ここのつ、こ			きゅう、く	ナイン",
	"10"=>"	とお				じゅう、じ	テン"
}


data=data.map{|k,v|NKF.nkf('-wh2',v).split(/\t| |、/).select{|x| x.length>0}}
p data



#require './chardata'



convmap={}
data.each_index{|num|
	data[num].each{|key|
		convmap[key]=num.to_s
	}
}


def convert2(str,convmap)#doesn't work
    return "" if str==""
    (1...str.length).each{|n|
	num=convmap[str.slice(0,n)]
	if(num)
		out=convert2(str.slice(n),convmap)
		return num+out if out!=nil
	end
    }
    return nil;
end

def convert(str,convmap)
    out = ""
    str.each_char{|ch|
	out+=convmap[ch]
    }
    out
end


loop{
	str=STDIN.gets.chop
	p str
	p convert(str,convmap)
}