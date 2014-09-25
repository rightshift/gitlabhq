class CreateBranchService
  def execute(project, branch_name, ref, current_user)
    valid_branch = Gitlab::GitRefValidator.validate(branch_name)
    if valid_branch == false
      return error('Branch name invalid')
    end

    repository = project.repository
    existing_branch = repository.find_branch(branch_name)
    if existing_branch
      return error('Branch already exists')
    end

    repository.add_branch(branch_name, ref)
    new_branch = repository.find_branch(branch_name)

    if new_branch
      Event.create_ref_event(project, current_user, new_branch, 'add')
      return success(new_branch)
    else
      return error('Invalid reference name')
    end
  end

  def error(message)
    {
      message: message,
      status: :error
    }
  end

  def success(branch)
    {
      branch: branch,
      status: :success
    }
  end
end
