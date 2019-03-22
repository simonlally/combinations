class PagesController < ApplicationController
  
  before_action :set_results

  def set_results
    @results = []
  end

  def index
  end

  def calculate
      req = (params[:items])
 
      names = []
      denoms = []
      
      # parsing the request object and extracting denoms and names into own arrays
      req.each do |key, value|
        
        value.each do |k,v|
          if k == "name" and k != nil
            names << v
          end
      
          if k == "denom" and v != nil
            denoms << v.to_f
          end
      
        end
      end

      # find the highest number, use it as the target and a base for converting the other currencies
      target = denoms.max

      # transform/map our denoms map with the converted values
      transformedValues = [];
      denoms.map { |n| transformedValues << target / n }
      
      # place holder array to hold most recent found combination
      current_result = Array.new(denoms.length)
      
      # start calculating combinations recursively
      test transformedValues, target, 0, current_result

      # send the calculations as a response (using our results array)
      render json: @results.as_json

  end

  def test(arr, target, current_index, current_result)

    if target == 0
      # match is found,  add match to array as a string      
      @results << current_result.to_s
      return
    end
    
    # if this equates we're done
    if current_index == current_result.length
      return
    end
    
    # set the current denomination we are working with based on where we are in the passed in array
    current_denom = arr[current_index]
    
    # set i = -1 so that our while loop iterator starts at 0
    i = -1
    while i*current_denom < target
      i+=1
      # set the value in current_result to the iterator
      current_result[current_index] = i
      # call recursively to loop through every permutation of the index changed in the above line
      test arr, target - i*current_denom, current_index+1, current_result
      # reset the value to zero
      current_result[current_index] = 0
    end
  
  end


end
