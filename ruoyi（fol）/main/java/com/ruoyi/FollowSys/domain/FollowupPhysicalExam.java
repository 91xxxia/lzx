package com.ruoyi.FollowSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 体征对象 followup_physical_exam
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class FollowupPhysicalExam extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 体征号 */
    private Long examId;

    /** 随访号 */
    @Excel(name = "随访号")
    private Long followupId;

    /** 温度 */
    @Excel(name = "温度")
    private Long temperatureC;

    /** 脉搏 */
    @Excel(name = "脉搏")
    private Long pulseBpm;

    /** 血氧饱和度 */
    @Excel(name = "血氧饱和度")
    private Long spo2Percent;

    /** 有无吸氧 */
    @Excel(name = "有无吸氧")
    private Integer oxygenUsed;

    /** 神志 */
    @Excel(name = "神志")
    private String consciousness;

    /** 精神 */
    @Excel(name = "精神")
    private String mentalState;

    /** 呼吸 */
    @Excel(name = "呼吸")
    private String breathingPattern;

    /** 外观 */
    @Excel(name = "外观")
    private String appearance;

    /** 鼻腔黏膜苍白 */
    @Excel(name = "鼻腔黏膜苍白")
    private Integer nasalMucosaPale;

    /** 鼻腔黏膜水肿 */
    @Excel(name = "鼻腔黏膜水肿")
    private Integer nasalMucosaEdema;

    /** 鼻腔黏膜肿胀 */
    @Excel(name = "鼻腔黏膜肿胀")
    private Integer nasalMucosaSwelling;

    /** 鼻腔黏膜清涕 */
    @Excel(name = "鼻腔黏膜清涕")
    private Integer nasalMucosaClearDischarge;

    /** 鼻腔黏膜评分 */
    @Excel(name = "鼻腔黏膜评分")
    private Long nasalScore;

    /** 三凹征 */
    @Excel(name = "三凹征")
    private Integer threeDepressionSign;

    /** 左肺呼吸音 */
    @Excel(name = "左肺呼吸音")
    private String leftLungSound;

    /** 左肺闻及干啰音 */
    @Excel(name = "左肺闻及干啰音")
    private Integer leftDryRalesPresent;

    /** 左肺闻及干啰音分布 */
    @Excel(name = "左肺闻及干啰音分布")
    private String leftDryRalesDistribution;

    /** 左肺闻及湿啰音 */
    @Excel(name = "左肺闻及湿啰音")
    private Integer leftWetRalesPresent;

    /** 左肺闻及湿啰音分布 */
    @Excel(name = "左肺闻及湿啰音分布")
    private String leftWetRalesDistribution;

    /** 右肺呼吸音 */
    @Excel(name = "右肺呼吸音")
    private String rightLungSound;

    /** 右肺闻及干啰音 */
    @Excel(name = "右肺闻及干啰音")
    private Integer rightDryRalesPresent;

    /** 右肺闻及干啰音分布 */
    @Excel(name = "右肺闻及干啰音分布")
    private String rightDryRalesDistribution;

    /** 右肺闻及湿啰音 */
    @Excel(name = "右肺闻及湿啰音")
    private Integer rightWetRalesPresent;

    /** 右肺闻及湿啰音分布 */
    @Excel(name = "右肺闻及湿啰音分布")
    private String rightWetRalesDistribution;

    /** 心率 */
    @Excel(name = "心率")
    private Long heartRate;

    /** 心律 */
    @Excel(name = "心律")
    private String heartRhythm;

    /** 心脏闻及杂音 */
    @Excel(name = "心脏闻及杂音")
    private Integer heartMurmurPresent;

    /** 心脏闻及杂音类型 */
    @Excel(name = "心脏闻及杂音类型")
    private String heartMurmurType;

    /** 腹 */
    @Excel(name = "腹")
    private String abdomenShape;

    /** 腹压痛 */
    @Excel(name = "腹压痛")
    private Integer abdomenTenderness;

    /** 反跳痛 */
    @Excel(name = "反跳痛")
    private Integer reboundTenderness;

    /** 头颈红斑 */
    @Excel(name = "头颈红斑")
    private Integer headNeckErythema;

    /** 头颈丘疹 */
    @Excel(name = "头颈丘疹")
    private Integer headNeckPapule;

    /** 头颈渗出 */
    @Excel(name = "头颈渗出")
    private Integer headNeckExudation;

    /** 头颈表皮剥脱 */
    @Excel(name = "头颈表皮剥脱")
    private Integer headNeckDesquamation;

    /** 头颈苔藓样变 */
    @Excel(name = "头颈苔藓样变")
    private Integer headNeckLichenification;

    /** 头颈干燥 */
    @Excel(name = "头颈干燥")
    private Integer headNeckDryness;

    /** 头颈其他 */
    @Excel(name = "头颈其他")
    private String headNeckOther;

    /** 上肢红斑 */
    @Excel(name = "上肢红斑")
    private Integer upperLimbErythema;

    /** 上肢丘疹 */
    @Excel(name = "上肢丘疹")
    private Integer upperLimbPapule;

    /** 上肢渗出 */
    @Excel(name = "上肢渗出")
    private Integer upperLimbExudation;

    /** 上肢表皮剥脱 */
    @Excel(name = "上肢表皮剥脱")
    private Integer upperLimbDesquamation;

    /** 上肢苔藓样变 */
    @Excel(name = "上肢苔藓样变")
    private Integer upperLimbLichenification;

    /** 上肢干燥 */
    @Excel(name = "上肢干燥")
    private Integer upperLimbDryness;

    /** 上肢其他 */
    @Excel(name = "上肢其他")
    private String upperLimbOther;

    /** 躯干红斑 */
    @Excel(name = "躯干红斑")
    private Integer trunkErythema;

    /** 躯干丘疹 */
    @Excel(name = "躯干丘疹")
    private Integer trunkPapule;

    /** 躯干渗出 */
    @Excel(name = "躯干渗出")
    private Integer trunkExudation;

    /** 躯干表皮剥脱 */
    @Excel(name = "躯干表皮剥脱")
    private Integer trunkDesquamation;

    /** 躯干苔藓样变 */
    @Excel(name = "躯干苔藓样变")
    private Integer trunkLichenification;

    /** 躯干干燥 */
    @Excel(name = "躯干干燥")
    private Integer trunkDryness;

    /** 躯干其他 */
    @Excel(name = "躯干其他")
    private String trunkOther;

    /** 下肢红斑 */
    @Excel(name = "下肢红斑")
    private Integer lowerLimbErythema;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer lowerLimbPapule;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer lowerLimbExudation;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer lowerLimbDesquamation;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer lowerLimbLichenification;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer lowerLimbDryness;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String lowerLimbOther;

    /** 生殖器红斑 */
    @Excel(name = "生殖器红斑")
    private Integer genitalErythema;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer genitalPapule;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer genitalExudation;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer genitalDesquamation;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer genitalLichenification;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer genitalDryness;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String genitalOther;

    /** 电子呼吸音 */
    @Excel(name = "电子呼吸音")
    private String electronicBreathSoundPath;

    public void setExamId(Long examId) 
    {
        this.examId = examId;
    }

    public Long getExamId() 
    {
        return examId;
    }

    public void setFollowupId(Long followupId) 
    {
        this.followupId = followupId;
    }

    public Long getFollowupId() 
    {
        return followupId;
    }

    public void setTemperatureC(Long temperatureC) 
    {
        this.temperatureC = temperatureC;
    }

    public Long getTemperatureC() 
    {
        return temperatureC;
    }

    public void setPulseBpm(Long pulseBpm) 
    {
        this.pulseBpm = pulseBpm;
    }

    public Long getPulseBpm() 
    {
        return pulseBpm;
    }

    public void setSpo2Percent(Long spo2Percent) 
    {
        this.spo2Percent = spo2Percent;
    }

    public Long getSpo2Percent() 
    {
        return spo2Percent;
    }

    public void setOxygenUsed(Integer oxygenUsed) 
    {
        this.oxygenUsed = oxygenUsed;
    }

    public Integer getOxygenUsed() 
    {
        return oxygenUsed;
    }

    public void setConsciousness(String consciousness) 
    {
        this.consciousness = consciousness;
    }

    public String getConsciousness() 
    {
        return consciousness;
    }

    public void setMentalState(String mentalState) 
    {
        this.mentalState = mentalState;
    }

    public String getMentalState() 
    {
        return mentalState;
    }

    public void setBreathingPattern(String breathingPattern) 
    {
        this.breathingPattern = breathingPattern;
    }

    public String getBreathingPattern() 
    {
        return breathingPattern;
    }

    public void setAppearance(String appearance) 
    {
        this.appearance = appearance;
    }

    public String getAppearance() 
    {
        return appearance;
    }

    public void setNasalMucosaPale(Integer nasalMucosaPale) 
    {
        this.nasalMucosaPale = nasalMucosaPale;
    }

    public Integer getNasalMucosaPale() 
    {
        return nasalMucosaPale;
    }

    public void setNasalMucosaEdema(Integer nasalMucosaEdema) 
    {
        this.nasalMucosaEdema = nasalMucosaEdema;
    }

    public Integer getNasalMucosaEdema() 
    {
        return nasalMucosaEdema;
    }

    public void setNasalMucosaSwelling(Integer nasalMucosaSwelling) 
    {
        this.nasalMucosaSwelling = nasalMucosaSwelling;
    }

    public Integer getNasalMucosaSwelling() 
    {
        return nasalMucosaSwelling;
    }

    public void setNasalMucosaClearDischarge(Integer nasalMucosaClearDischarge) 
    {
        this.nasalMucosaClearDischarge = nasalMucosaClearDischarge;
    }

    public Integer getNasalMucosaClearDischarge() 
    {
        return nasalMucosaClearDischarge;
    }

    public void setNasalScore(Long nasalScore) 
    {
        this.nasalScore = nasalScore;
    }

    public Long getNasalScore() 
    {
        return nasalScore;
    }

    public void setThreeDepressionSign(Integer threeDepressionSign) 
    {
        this.threeDepressionSign = threeDepressionSign;
    }

    public Integer getThreeDepressionSign() 
    {
        return threeDepressionSign;
    }

    public void setLeftLungSound(String leftLungSound) 
    {
        this.leftLungSound = leftLungSound;
    }

    public String getLeftLungSound() 
    {
        return leftLungSound;
    }

    public void setLeftDryRalesPresent(Integer leftDryRalesPresent) 
    {
        this.leftDryRalesPresent = leftDryRalesPresent;
    }

    public Integer getLeftDryRalesPresent() 
    {
        return leftDryRalesPresent;
    }

    public void setLeftDryRalesDistribution(String leftDryRalesDistribution) 
    {
        this.leftDryRalesDistribution = leftDryRalesDistribution;
    }

    public String getLeftDryRalesDistribution() 
    {
        return leftDryRalesDistribution;
    }

    public void setLeftWetRalesPresent(Integer leftWetRalesPresent) 
    {
        this.leftWetRalesPresent = leftWetRalesPresent;
    }

    public Integer getLeftWetRalesPresent() 
    {
        return leftWetRalesPresent;
    }

    public void setLeftWetRalesDistribution(String leftWetRalesDistribution) 
    {
        this.leftWetRalesDistribution = leftWetRalesDistribution;
    }

    public String getLeftWetRalesDistribution() 
    {
        return leftWetRalesDistribution;
    }

    public void setRightLungSound(String rightLungSound) 
    {
        this.rightLungSound = rightLungSound;
    }

    public String getRightLungSound() 
    {
        return rightLungSound;
    }

    public void setRightDryRalesPresent(Integer rightDryRalesPresent) 
    {
        this.rightDryRalesPresent = rightDryRalesPresent;
    }

    public Integer getRightDryRalesPresent() 
    {
        return rightDryRalesPresent;
    }

    public void setRightDryRalesDistribution(String rightDryRalesDistribution) 
    {
        this.rightDryRalesDistribution = rightDryRalesDistribution;
    }

    public String getRightDryRalesDistribution() 
    {
        return rightDryRalesDistribution;
    }

    public void setRightWetRalesPresent(Integer rightWetRalesPresent) 
    {
        this.rightWetRalesPresent = rightWetRalesPresent;
    }

    public Integer getRightWetRalesPresent() 
    {
        return rightWetRalesPresent;
    }

    public void setRightWetRalesDistribution(String rightWetRalesDistribution) 
    {
        this.rightWetRalesDistribution = rightWetRalesDistribution;
    }

    public String getRightWetRalesDistribution() 
    {
        return rightWetRalesDistribution;
    }

    public void setHeartRate(Long heartRate) 
    {
        this.heartRate = heartRate;
    }

    public Long getHeartRate() 
    {
        return heartRate;
    }

    public void setHeartRhythm(String heartRhythm) 
    {
        this.heartRhythm = heartRhythm;
    }

    public String getHeartRhythm() 
    {
        return heartRhythm;
    }

    public void setHeartMurmurPresent(Integer heartMurmurPresent) 
    {
        this.heartMurmurPresent = heartMurmurPresent;
    }

    public Integer getHeartMurmurPresent() 
    {
        return heartMurmurPresent;
    }

    public void setHeartMurmurType(String heartMurmurType) 
    {
        this.heartMurmurType = heartMurmurType;
    }

    public String getHeartMurmurType() 
    {
        return heartMurmurType;
    }

    public void setAbdomenShape(String abdomenShape) 
    {
        this.abdomenShape = abdomenShape;
    }

    public String getAbdomenShape() 
    {
        return abdomenShape;
    }

    public void setAbdomenTenderness(Integer abdomenTenderness) 
    {
        this.abdomenTenderness = abdomenTenderness;
    }

    public Integer getAbdomenTenderness() 
    {
        return abdomenTenderness;
    }

    public void setReboundTenderness(Integer reboundTenderness) 
    {
        this.reboundTenderness = reboundTenderness;
    }

    public Integer getReboundTenderness() 
    {
        return reboundTenderness;
    }

    public void setHeadNeckErythema(Integer headNeckErythema) 
    {
        this.headNeckErythema = headNeckErythema;
    }

    public Integer getHeadNeckErythema() 
    {
        return headNeckErythema;
    }

    public void setHeadNeckPapule(Integer headNeckPapule) 
    {
        this.headNeckPapule = headNeckPapule;
    }

    public Integer getHeadNeckPapule() 
    {
        return headNeckPapule;
    }

    public void setHeadNeckExudation(Integer headNeckExudation) 
    {
        this.headNeckExudation = headNeckExudation;
    }

    public Integer getHeadNeckExudation() 
    {
        return headNeckExudation;
    }

    public void setHeadNeckDesquamation(Integer headNeckDesquamation) 
    {
        this.headNeckDesquamation = headNeckDesquamation;
    }

    public Integer getHeadNeckDesquamation() 
    {
        return headNeckDesquamation;
    }

    public void setHeadNeckLichenification(Integer headNeckLichenification) 
    {
        this.headNeckLichenification = headNeckLichenification;
    }

    public Integer getHeadNeckLichenification() 
    {
        return headNeckLichenification;
    }

    public void setHeadNeckDryness(Integer headNeckDryness) 
    {
        this.headNeckDryness = headNeckDryness;
    }

    public Integer getHeadNeckDryness() 
    {
        return headNeckDryness;
    }

    public void setHeadNeckOther(String headNeckOther) 
    {
        this.headNeckOther = headNeckOther;
    }

    public String getHeadNeckOther() 
    {
        return headNeckOther;
    }

    public void setUpperLimbErythema(Integer upperLimbErythema) 
    {
        this.upperLimbErythema = upperLimbErythema;
    }

    public Integer getUpperLimbErythema() 
    {
        return upperLimbErythema;
    }

    public void setUpperLimbPapule(Integer upperLimbPapule) 
    {
        this.upperLimbPapule = upperLimbPapule;
    }

    public Integer getUpperLimbPapule() 
    {
        return upperLimbPapule;
    }

    public void setUpperLimbExudation(Integer upperLimbExudation) 
    {
        this.upperLimbExudation = upperLimbExudation;
    }

    public Integer getUpperLimbExudation() 
    {
        return upperLimbExudation;
    }

    public void setUpperLimbDesquamation(Integer upperLimbDesquamation) 
    {
        this.upperLimbDesquamation = upperLimbDesquamation;
    }

    public Integer getUpperLimbDesquamation() 
    {
        return upperLimbDesquamation;
    }

    public void setUpperLimbLichenification(Integer upperLimbLichenification) 
    {
        this.upperLimbLichenification = upperLimbLichenification;
    }

    public Integer getUpperLimbLichenification() 
    {
        return upperLimbLichenification;
    }

    public void setUpperLimbDryness(Integer upperLimbDryness) 
    {
        this.upperLimbDryness = upperLimbDryness;
    }

    public Integer getUpperLimbDryness() 
    {
        return upperLimbDryness;
    }

    public void setUpperLimbOther(String upperLimbOther) 
    {
        this.upperLimbOther = upperLimbOther;
    }

    public String getUpperLimbOther() 
    {
        return upperLimbOther;
    }

    public void setTrunkErythema(Integer trunkErythema) 
    {
        this.trunkErythema = trunkErythema;
    }

    public Integer getTrunkErythema() 
    {
        return trunkErythema;
    }

    public void setTrunkPapule(Integer trunkPapule) 
    {
        this.trunkPapule = trunkPapule;
    }

    public Integer getTrunkPapule() 
    {
        return trunkPapule;
    }

    public void setTrunkExudation(Integer trunkExudation) 
    {
        this.trunkExudation = trunkExudation;
    }

    public Integer getTrunkExudation() 
    {
        return trunkExudation;
    }

    public void setTrunkDesquamation(Integer trunkDesquamation) 
    {
        this.trunkDesquamation = trunkDesquamation;
    }

    public Integer getTrunkDesquamation() 
    {
        return trunkDesquamation;
    }

    public void setTrunkLichenification(Integer trunkLichenification) 
    {
        this.trunkLichenification = trunkLichenification;
    }

    public Integer getTrunkLichenification() 
    {
        return trunkLichenification;
    }

    public void setTrunkDryness(Integer trunkDryness) 
    {
        this.trunkDryness = trunkDryness;
    }

    public Integer getTrunkDryness() 
    {
        return trunkDryness;
    }

    public void setTrunkOther(String trunkOther) 
    {
        this.trunkOther = trunkOther;
    }

    public String getTrunkOther() 
    {
        return trunkOther;
    }

    public void setLowerLimbErythema(Integer lowerLimbErythema) 
    {
        this.lowerLimbErythema = lowerLimbErythema;
    }

    public Integer getLowerLimbErythema() 
    {
        return lowerLimbErythema;
    }

    public void setLowerLimbPapule(Integer lowerLimbPapule) 
    {
        this.lowerLimbPapule = lowerLimbPapule;
    }

    public Integer getLowerLimbPapule() 
    {
        return lowerLimbPapule;
    }

    public void setLowerLimbExudation(Integer lowerLimbExudation) 
    {
        this.lowerLimbExudation = lowerLimbExudation;
    }

    public Integer getLowerLimbExudation() 
    {
        return lowerLimbExudation;
    }

    public void setLowerLimbDesquamation(Integer lowerLimbDesquamation) 
    {
        this.lowerLimbDesquamation = lowerLimbDesquamation;
    }

    public Integer getLowerLimbDesquamation() 
    {
        return lowerLimbDesquamation;
    }

    public void setLowerLimbLichenification(Integer lowerLimbLichenification) 
    {
        this.lowerLimbLichenification = lowerLimbLichenification;
    }

    public Integer getLowerLimbLichenification() 
    {
        return lowerLimbLichenification;
    }

    public void setLowerLimbDryness(Integer lowerLimbDryness) 
    {
        this.lowerLimbDryness = lowerLimbDryness;
    }

    public Integer getLowerLimbDryness() 
    {
        return lowerLimbDryness;
    }

    public void setLowerLimbOther(String lowerLimbOther) 
    {
        this.lowerLimbOther = lowerLimbOther;
    }

    public String getLowerLimbOther() 
    {
        return lowerLimbOther;
    }

    public void setGenitalErythema(Integer genitalErythema) 
    {
        this.genitalErythema = genitalErythema;
    }

    public Integer getGenitalErythema() 
    {
        return genitalErythema;
    }

    public void setGenitalPapule(Integer genitalPapule) 
    {
        this.genitalPapule = genitalPapule;
    }

    public Integer getGenitalPapule() 
    {
        return genitalPapule;
    }

    public void setGenitalExudation(Integer genitalExudation) 
    {
        this.genitalExudation = genitalExudation;
    }

    public Integer getGenitalExudation() 
    {
        return genitalExudation;
    }

    public void setGenitalDesquamation(Integer genitalDesquamation) 
    {
        this.genitalDesquamation = genitalDesquamation;
    }

    public Integer getGenitalDesquamation() 
    {
        return genitalDesquamation;
    }

    public void setGenitalLichenification(Integer genitalLichenification) 
    {
        this.genitalLichenification = genitalLichenification;
    }

    public Integer getGenitalLichenification() 
    {
        return genitalLichenification;
    }

    public void setGenitalDryness(Integer genitalDryness) 
    {
        this.genitalDryness = genitalDryness;
    }

    public Integer getGenitalDryness() 
    {
        return genitalDryness;
    }

    public void setGenitalOther(String genitalOther) 
    {
        this.genitalOther = genitalOther;
    }

    public String getGenitalOther() 
    {
        return genitalOther;
    }

    public void setElectronicBreathSoundPath(String electronicBreathSoundPath) 
    {
        this.electronicBreathSoundPath = electronicBreathSoundPath;
    }

    public String getElectronicBreathSoundPath() 
    {
        return electronicBreathSoundPath;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("examId", getExamId())
            .append("followupId", getFollowupId())
            .append("temperatureC", getTemperatureC())
            .append("pulseBpm", getPulseBpm())
            .append("spo2Percent", getSpo2Percent())
            .append("oxygenUsed", getOxygenUsed())
            .append("consciousness", getConsciousness())
            .append("mentalState", getMentalState())
            .append("breathingPattern", getBreathingPattern())
            .append("appearance", getAppearance())
            .append("nasalMucosaPale", getNasalMucosaPale())
            .append("nasalMucosaEdema", getNasalMucosaEdema())
            .append("nasalMucosaSwelling", getNasalMucosaSwelling())
            .append("nasalMucosaClearDischarge", getNasalMucosaClearDischarge())
            .append("nasalScore", getNasalScore())
            .append("threeDepressionSign", getThreeDepressionSign())
            .append("leftLungSound", getLeftLungSound())
            .append("leftDryRalesPresent", getLeftDryRalesPresent())
            .append("leftDryRalesDistribution", getLeftDryRalesDistribution())
            .append("leftWetRalesPresent", getLeftWetRalesPresent())
            .append("leftWetRalesDistribution", getLeftWetRalesDistribution())
            .append("rightLungSound", getRightLungSound())
            .append("rightDryRalesPresent", getRightDryRalesPresent())
            .append("rightDryRalesDistribution", getRightDryRalesDistribution())
            .append("rightWetRalesPresent", getRightWetRalesPresent())
            .append("rightWetRalesDistribution", getRightWetRalesDistribution())
            .append("heartRate", getHeartRate())
            .append("heartRhythm", getHeartRhythm())
            .append("heartMurmurPresent", getHeartMurmurPresent())
            .append("heartMurmurType", getHeartMurmurType())
            .append("abdomenShape", getAbdomenShape())
            .append("abdomenTenderness", getAbdomenTenderness())
            .append("reboundTenderness", getReboundTenderness())
            .append("headNeckErythema", getHeadNeckErythema())
            .append("headNeckPapule", getHeadNeckPapule())
            .append("headNeckExudation", getHeadNeckExudation())
            .append("headNeckDesquamation", getHeadNeckDesquamation())
            .append("headNeckLichenification", getHeadNeckLichenification())
            .append("headNeckDryness", getHeadNeckDryness())
            .append("headNeckOther", getHeadNeckOther())
            .append("upperLimbErythema", getUpperLimbErythema())
            .append("upperLimbPapule", getUpperLimbPapule())
            .append("upperLimbExudation", getUpperLimbExudation())
            .append("upperLimbDesquamation", getUpperLimbDesquamation())
            .append("upperLimbLichenification", getUpperLimbLichenification())
            .append("upperLimbDryness", getUpperLimbDryness())
            .append("upperLimbOther", getUpperLimbOther())
            .append("trunkErythema", getTrunkErythema())
            .append("trunkPapule", getTrunkPapule())
            .append("trunkExudation", getTrunkExudation())
            .append("trunkDesquamation", getTrunkDesquamation())
            .append("trunkLichenification", getTrunkLichenification())
            .append("trunkDryness", getTrunkDryness())
            .append("trunkOther", getTrunkOther())
            .append("lowerLimbErythema", getLowerLimbErythema())
            .append("lowerLimbPapule", getLowerLimbPapule())
            .append("lowerLimbExudation", getLowerLimbExudation())
            .append("lowerLimbDesquamation", getLowerLimbDesquamation())
            .append("lowerLimbLichenification", getLowerLimbLichenification())
            .append("lowerLimbDryness", getLowerLimbDryness())
            .append("lowerLimbOther", getLowerLimbOther())
            .append("genitalErythema", getGenitalErythema())
            .append("genitalPapule", getGenitalPapule())
            .append("genitalExudation", getGenitalExudation())
            .append("genitalDesquamation", getGenitalDesquamation())
            .append("genitalLichenification", getGenitalLichenification())
            .append("genitalDryness", getGenitalDryness())
            .append("genitalOther", getGenitalOther())
            .append("electronicBreathSoundPath", getElectronicBreathSoundPath())
            .toString();
    }
}
