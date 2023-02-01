public int[] TwoSum(int[] nums, int target) {        
    Dictionary<int, int> dict = new Dictionary<int, int>();    
    for (int i=0; i<nums.Length; i++) {
        if (!dict.ContainsKey(target-nums[i])) {
            dict[nums[i]] = i;
        } else {
            return new int[] {dict[target-nums[i]], i};
        }
    }
    return null;
}