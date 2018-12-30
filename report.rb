#!/usr/bin/env ruby
require File.expand_path('../prepare_report', __FILE__)
#require 'byebug'

ARGV.each do |value|
  puts value
  if value == 'data.txt'
    data = []
    grade_a_sum, grade_b_sum, grade_c_sum = [], [], []
    pr = PrepareReport.new
    File.open(value, "r") do |f|
      f.each_line do |line|
        record = line.split(',')
        subject = pr.parse_subject(record[1..record.count-1])
        grand_total = subject.sum
        grade = pr.rule(grand_total)
        if grade == 'A'
          grade_a_sum << grand_total
        elsif grade == 'B'
          grade_b_sum << grand_total
        else
          grade_c_sum << grand_total
        end
        data << [record[0].to_i] + subject + [grand_total, grade]  
      end
    end
    pr.prepare_report(data, grade_a_sum, grade_b_sum, grade_c_sum)  
  end 
end