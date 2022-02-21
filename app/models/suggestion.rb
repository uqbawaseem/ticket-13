class Suggestion < ApplicationRecord
    belongs_to :suggestionable, polymorphic: true, optional: true
end
