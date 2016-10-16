#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
module LogicCircuit
  module Boolean
    refine TrueClass do
      def to_i; 1; end
      def to_s; to_i.to_s; end
    end
    refine FalseClass do
      def to_i; 0; end
      def to_s; to_i.to_s; end
    end
  end
end
