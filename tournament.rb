class Team

attr_accessor :name, :ranking

	def initialize(name, ranking)
		@name = name
		@ranking = ranking
	end

end

@teams = []

def menu
	puts "Choose From the Following:"
	puts "----------------------"
	puts "1. Enter Teams"
	puts "2. List Teams"
	puts "3. List Match-ups"
	puts "0. Exit Program"

	choice = gets.chomp.to_i

	case choice
		when 1
			enter_teams
		when 2
			list_teams
		when 3
			matchup
		when 0
			puts "Thanks for coming."
		else
			clear_screen
			puts "Not a valid selection. Try again."
			menu
	end
end

def clear_screen
  Gem.win_platform? ? (system "cls") : (system "clear")
end

def enter_teams
	finished = false
	puts "Enter team names and rankings. Type 'done' when done."

	while finished == false             # while !finished
		print "Team Name: "
		name = gets.chomp
		if name == "done"
			finished = true
		else
			print "Ranking: "
			ranking = gets.chomp.to_i
			team = Team.new(name, ranking)
			@teams.push(team)
			puts "Team successfully created!"
		end
	end

	clear_screen
	menu
end

def list_teams
	@teams.each_with_index do |team, index|
		puts "#{index+1}. #{team.name}"
	end

	return_to_menu
end

def matchup
	puts "Matchups:"

	temp_arr = []
	@teams.each do |team|
		temp_arr.push(team)
	end
	
	if @teams.length%2 != 0
		puts "(#{temp_arr[0].ranking}) #{temp_arr.delete_at(0).name} has a bye"
	end

	while temp_arr.length > 0
		puts "(#{temp_arr[0].ranking}) #{temp_arr.delete_at(0).name} versus (#{temp_arr[-1].ranking}) #{temp_arr.delete_at(-1).name}"
	end

	return_to_menu
end

def return_to_menu
	puts "Return to main menu? [y/n]"

	choice = gets.chomp.downcase

	if choice == "y"
		clear_screen
		menu
	else
		puts "Okay. Thanks for coming."
	end
end

puts "Welcome to the Tournament Program"
menu