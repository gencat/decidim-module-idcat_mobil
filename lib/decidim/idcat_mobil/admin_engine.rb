# # frozen_string_literal: true

# module Decidim
#   module IdcatMobil
#     # This is the engine that runs on the public interface of `IdcatMobil`.
#     class AdminEngine < ::Rails::Engine
#       isolate_namespace Decidim::IdcatMobil::Admin

#       paths["db/migrate"] = nil
#       paths["lib/tasks"] = nil

#       routes do
#         # Add admin engine routes here
#         # resources :idcat_mobil do
#         #   collection do
#         #     resources :exports, only: [:create]
#         #   end
#         # end
#         # root to: "idcat_mobil#index"
#       end

#       def load_seed
#         nil
#       end
#     end
#   end
# end
