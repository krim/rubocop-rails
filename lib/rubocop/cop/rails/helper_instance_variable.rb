# frozen_string_literal: true

module RuboCop
  module Cop
    module Rails
      # This cop checks for use of the helper methods which reference
      # instance variables.
      #
      # Relying on the existing of a particular instance variable
      # makes it difficult to re-use helper methods in different
      # contexts.
      #
      # If it seems awkward to explicitly pass in each dependent
      # variable, consider moving the behaviour elsewhere, for
      # example to a model, decorator or presenter.
      #
      # @example
      #   # bad
      #   def welcome_message
      #     "Hello " + @user.name
      #   end
      #
      #   # good
      #   def welcome_message(user)
      #     "Hello " + user.name
      #   end
      class HelperInstanceVariable < Cop
        MSG = 'Do not use instance variables in helpers.'.freeze

        def on_ivar(node)
          add_offense(node)
        end
      end
    end
  end
end
