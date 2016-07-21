# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

## Your test code can go here

# binding.pry
def qualified_candidates(candidates)
  candidates.select { |candidate| qualified?(candidate) }
end

def ordered_by_qualifications(candidates)
  ordered = candidates.sort do |a, b|

    if a[:years_of_experience] == b[:years_of_experience]
      b[:github_points] <=> a[:github_points]

    else
      b[:years_of_experience] <=> a[:years_of_experience]
    end

  end
  pp ordered
end

def repl()
  quit_program = true
  while quit_program do
    input = gets.chomp
    case input

    when "all"
      print_info(@candidates)

    when "quit"
      quit_program = false
      break

    when "qualified"
      qualified = qualified_candidates(@candidates)
      print_info(qualified)

    else

      if input.include?('find')
        candidate_id = find_id(input)
        candidate_info = find(candidate_id)
        print_info(candidate_info)

      end
    end
  end
end

def find_id(input)
  id = input[/\d+/].to_i
end

def print_info(info)
    info.each do |item|
      print(item)
      print("\n")
    end
end


repl()

=begin
 candidate1 = {
     id: 10,
     years_of_experience: 3,
     github_points: 232,
     languages: ['Java', 'Ruby', 'JavaScript'],
     date_applied: 12.days.ago.to_date,
     age: 31
   }

 candidate2 = {
     id: 7,
     years_of_experience: 1,
     github_points: 145,
     languages: ['C++', 'Go', 'Erlang'],
     date_applied: 30.days.ago.to_date,
     age: 16
   }

 puts "applied? should return true for applications within due date"
 puts applied?(candidate1) == true
 puts applied?(candidate2) == false

 puts "age? should return true for eligible age"
 puts age?(candidate2) == false
 puts age?(candidate1) == true

 puts "languages? should return true for knowing either ruby/python"
 puts languages?(candidate2) == false
 puts languages?(candidate1) == true

 puts find(7)
 puts experienced?(candidate2) == false
=end