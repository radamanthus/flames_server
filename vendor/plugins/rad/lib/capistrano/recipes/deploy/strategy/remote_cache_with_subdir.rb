require 'capistrano/recipes/deploy/strategy/remote_cache'

module Capistrano
  module Deploy
    module Strategy

      # Implements the deployment strategy that keeps a cached checkout of
      # the source code on each remote server. Each deploy simply updates the
      # cached checkout, and then does a copy from the cached copy to the
      # final deployment location.
      class RemoteCacheWithSubdir < Capistrano::Deploy::Strategy::RemoteCache

         def copy_repository_cache
            cached_subdir = File.join(repository_cache, deploy_subdir) 
            
            logger.trace "copying the cached version from #{cached_subdir} to #{configuration[:release_path]}"
            
            exclusions = copy_exclude.map { |e| "--exclude=\"#{e}\"" }.join(' ')
            run "rsync -Lrpt #{exclusions} #{cached_subdir}/* #{configuration[:release_path]} && #{mark}"
         end 
      end

    end
  end
end