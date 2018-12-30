class PrepareReport
  def parse_subject(data)
    return data.collect{|e| e.split('-')[1].to_i}
  end  

  def rule(score)
    if score >= 340
      'A'
    elsif score < 340 && score >= 300
      'B'
    else    
      'C'
    end  
  end  

  def prepare_report(data, grade_a_sum, grade_b_sum, grade_c_sum)
    puts "­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­------------------------------"
    puts "­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­ScoreCard"
    puts "ID | Subject1 | Subject2 | Subject3 | Subject4 | Grand­Total | Grade | Average­Compare |" 
    grade_a_avg = grade_a_sum.sum/grade_a_sum.size
    grade_b_avg = grade_b_sum.sum/grade_b_sum.size
    grade_c_avg = grade_c_sum.sum/grade_c_sum.size
    above_count, below_count = 0, 0
    data.each_with_index do |d, index|
      if d[6] == 'A'
        avg = if d[5] >= grade_a_avg 
          ['ABOVE', above_count += 1]
        else  
          ['BELOW', below_count += 1]
        end  
      elsif d[6] == 'B'
        avg = if d[5] >= grade_b_avg 
          ['ABOVE', above_count += 1]
        else  
          ['BELOW', below_count += 1]
        end
      else
        avg = if d[5] >= grade_c_avg 
          ['ABOVE', above_count += 1]
        else  
          ['BELOW', below_count += 1]
        end
      end  
      puts (d + [avg[0]]).join('   |   ')  
    end
    puts "­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­------------------------------"
    grade_report(grade_a_sum, grade_b_sum, grade_c_sum, above_count, below_count)
  end

  def grade_report(grade_a_sum, grade_b_sum, grade_c_sum, above_count, below_count)
    puts "­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­------------------------------"
    puts "­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­GradeReport"
    puts "Number of students in A Grade :: #{grade_a_sum.size}"
    puts "Number of students in B Grade :: #{grade_b_sum.size}"
    puts "Number of students in C Grade :: #{grade_c_sum.size}"
    puts "Number of students above their grade average :: #{above_count}"
    puts "Number of students below their grade average :: #{below_count}"
    puts "­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­------------------------------"
  end 
end  