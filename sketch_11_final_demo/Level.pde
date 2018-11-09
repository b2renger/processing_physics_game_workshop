class Level{
  
  public int agentNumber;
  public int agentRatePop;
  public int enemyNumber;
  public int enemyRatePop;
  public int enemyDamages;
  public float[] agentSpeedRange;
  
  public Level(int agentNumber,int agentRatePop, int enemyNumber,int enemyRatePop, int enemyDamages, float[] agentSpeedRange){
    this.agentNumber = agentNumber;
    this.agentRatePop = agentRatePop;
    this.enemyNumber = enemyNumber;
    this.enemyRatePop = enemyRatePop;
    this.enemyDamages = enemyDamages;
    this.agentSpeedRange = agentSpeedRange;
  }
  
}
