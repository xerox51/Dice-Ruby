def prob
	total = []
	args = []
	strings = []
	flag = [0,0,0,0,0,0,0,0]
	out = [100,100,100,100,100,100,100,100]
	(1..100).each do |i|
		total[i-1] = rand(1..6)
	end
	for i in 0..99
		if total[i] > 3
			args = args.push("U")
		else
		    	args = args.push("D")
		end
	end
	for i in 0..97
		strings[i] = args[i] + args[i+1] + args[i+2]
	end
	for i in 0..97
		strings[i] = strings[i].to_s
		if strings[i].eql?("DDD")
			flag[0] = flag[0] + 1
			if flag[0] == 1
				out[0] = i+3
			end
		elsif strings[i].eql?("DDU")
			flag[1] = flag[1] + 1
			if flag[1] == 1
				out[1] = i+3
			end
		elsif strings[i].eql?("DUU")
			flag[2] = flag[2] + 1
			if flag[2] == 1
				out[2] = i+3
			end
		elsif strings[i].eql?("DUD")
			flag[3] = flag[3] + 1
			if flag[3] == 1
				out[3] = i+3
			end
		elsif strings[i].eql?("UUU")
			flag[4] = flag[4] + 1
			if flag[4] == 1
				out[4] = i+3
			end
		elsif strings[i].eql?("UUD")
			flag[5] = flag[5] + 1
			if flag[5] == 1
				out[5] = i+3
			end
		elsif strings[i].eql?("UDD")
			flag[6] = flag[6] + 1
			if flag[6] == 1
				out[6] = i+3
			end
		else
			flag[7] = flag[7] + 1
			if flag[7] == 1
				out[7] = i+3
			end
		end
	end
	out
end

output = Array.new(10000,Array.new(8,0))

(0..9999).each do |i|
	output[i] = prob
end

num = Array.new(8,0)

for j in 0..7
	for i in 0..9999
		num[j] = num[j] + output[i][j]
	end
end

probability = []

for j in 0..7
	num[j] = num[j].to_f
	probability[j] = num[j]/10000.0
end

puts "DDD: "
p probability[0]
puts "DDU: "
p probability[1]
puts "DUU: "
p probability[2]
puts "DUD: "
p probability[3]
puts "UUU: "
p probability[4]
puts "UUD: "
p probability[5]
puts "UDD: "
p probability[6]
puts "UDU: "
p probability[7]

puts "DDU + DUU + UUD + UDD"
p (probability[1] + probability[2] + probability[5] + probability[6])/4

puts "DDD + UUU"
p (probability[0] + probability[4])/2