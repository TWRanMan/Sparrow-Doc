module History
  GIT_REPO_MAIN = Rails.root.to_s + '/git_repo'
  GIT_FOLDER_IDENTITY = '/.git'

  GIT_PROJECTS = GIT_REPO_MAIN + '/projects.git'

  class History

    def self.init
      if ! File.directory?(GIT_PROJECTS + GIT_FOLDER_IDENTITY)
        Git.init(GIT_PROJECTS)
      end
      Git.open(GIT_PROJECTS, :log => Logger.new(STDOUT))
    end

    def self.add_and_commit(project_git, commit_message)
      project_git.add(:all=>true)
      project_git.commit(commit_message)
    end

  end
end
