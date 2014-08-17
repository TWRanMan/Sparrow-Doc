module History
  GIT_REPO_MAIN = Rails.root.to_s + '/git_repo/'
  GIT_FOLDER_IDENTITY = '/.git'

  class History
    attr_accessor :project_git_path
    def initialize(project_name)
      @project_git_path = GIT_REPO_MAIN + project_name + '.git'
      if ! File.directory?(@project_git_path + GIT_FOLDER_IDENTITY)
        Git.init(@project_git_path)
      end
      @project_git = Git.open(@project_git_path, :log => Logger.new(STDOUT))
    end

    def add_and_commit_all(commit_message)
      @project_git.add(:all=>true)
      @project_git.commit(commit_message)
    end

  end
end
