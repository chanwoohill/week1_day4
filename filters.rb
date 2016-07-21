# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.select {|candidate| candidate[:id] == id}
end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

# More methods will go below

def github?(candidate)
  points = 100
  candidate[:github_points] >= points
end

def languages?(candidate)
  languages = ['Ruby', 'Python']
  candidate[:languages].include?('Ruby') || candidate[:languages].include?('Ruby')
end

def applied?(candidate)
  num_days = 15
  application_date = candidate[:date_applied]
  acceptable_date = num_days.days.ago.to_date
  #(acceptable_date <=> application_date) < 0 ? true : false
  application_date - acceptable_date > 0 
end

def age?(candidate)
  candidate[:age] >= 18
end

def qualified?(candidate)
  experienced?(candidate) && github?(candidate) && languages?(candidate) \
   && applied?(candidate) && age?(candidate)
end