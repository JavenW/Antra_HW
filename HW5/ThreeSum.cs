public IList<IList<int>> ThreeSum(int[] nums) {
    IList<IList<int>> answerList = new List<IList<int>>();
    Array.Sort(nums);
    for (int i = 0; i < nums.Length; i++) 
    {
        if (nums[i]>0){
            return answerList;
        }
        if (i==0 || nums[i] != nums[i-1]){
            int target = -1*nums[i];
            HashSet<int> saved = new HashSet<int>();
            Dictionary<int, int> dict = new Dictionary<int, int>();    
            for (int j=i+1; j<nums.Length; j++) {
                if (!dict.ContainsKey(target-nums[j])) {
                    dict[nums[j]] = j;
                } else {
                    if (!saved.Contains(nums[j])) {
                        saved.Add(nums[j]);
                        saved.Add(target-nums[j]);
                        int[] ans = {nums[i], nums[j], target-nums[j]};
                        answerList.Add(ans.ToList());
                    }
                }
            }
        }
    }
    return answerList;
}