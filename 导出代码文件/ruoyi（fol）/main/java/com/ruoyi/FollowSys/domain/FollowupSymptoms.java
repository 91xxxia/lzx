package com.ruoyi.FollowSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 症状对象 followup_symptoms
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class FollowupSymptoms extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 症状号 */
    private Long symptomId;

    /** 随访号 */
    @Excel(name = "随访号")
    private Long followupId;

    /** 鼻痒 */
    @Excel(name = "鼻痒")
    private Integer itchyNose;

    /** 喷嚏 */
    @Excel(name = "喷嚏")
    private Integer sneezing;

    /** 流清涕 */
    @Excel(name = "流清涕")
    private Integer clearDischarge;

    /** 鼻塞 */
    @Excel(name = "鼻塞")
    private Integer nasalCongestion;

    /** 眼痒 */
    @Excel(name = "眼痒")
    private Integer itchyEyes;

    /** 流泪 */
    @Excel(name = "流泪")
    private Integer tearing;

    /** 眼红 */
    @Excel(name = "眼红")
    private Integer redEyes;

    /** 眼灼热感 */
    @Excel(name = "眼灼热感")
    private Integer eyeBurning;

    /** 咽痒 */
    @Excel(name = "咽痒")
    private Integer itchyThroat;

    /** 发热 */
    @Excel(name = "发热")
    private Integer fever;

    /** 张口呼吸 */
    @Excel(name = "张口呼吸")
    private Integer mouthBreathing;

    /** 打鼾 */
    @Excel(name = "打鼾")
    private Integer snoring;

    /** 咳嗽 */
    @Excel(name = "咳嗽")
    private Integer cough;

    /** 喘息 */
    @Excel(name = "喘息")
    private Integer wheezing;

    /** 气促 */
    @Excel(name = "气促")
    private Integer dyspnea;

    /** 胸闷 */
    @Excel(name = "胸闷")
    private Integer chestTightness;

    /** 长叹气 */
    @Excel(name = "长叹气")
    private Integer sighing;

    /** 活动受限 */
    @Excel(name = "活动受限")
    private Integer activityLimitation;

    /** 夜间憋醒 */
    @Excel(name = "夜间憋醒")
    private Integer nighttimeAwake;

    /** 夜间及晨起症状加重 */
    @Excel(name = "夜间及晨起症状加重")
    private Integer morningNightWorse;

    /** 皮瘆 */
    @Excel(name = "皮瘆")
    private Integer rash;

    /** 瘙痒 */
    @Excel(name = "瘙痒")
    private Integer itching;

    /** 疼痛 */
    @Excel(name = "疼痛")
    private Integer pain;

    /** 睡眠障碍 */
    @Excel(name = "睡眠障碍")
    private Integer sleepDisorder;

    /** 严重程度 */
    @Excel(name = "严重程度")
    private String severity;

    /** 症状频率 */
    @Excel(name = "症状频率")
    private String frequencyPattern;

    /** 症状开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "症状开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startDate;

    /** 诱因抽烟 */
    @Excel(name = "诱因抽烟")
    private Integer triggerSmoke;

    /** 诱因尘螨 */
    @Excel(name = "诱因尘螨")
    private Integer triggerDustMite;

    /** 诱因花粉 */
    @Excel(name = "诱因花粉")
    private Integer triggerPollen;

    /** 诱因病毒感染 */
    @Excel(name = "诱因病毒感染")
    private Integer triggerVirus;

    /** 诱因霉菌 */
    @Excel(name = "诱因霉菌")
    private Integer triggerMold;

    /** 诱因冷空气 */
    @Excel(name = "诱因冷空气")
    private Integer triggerColdAir;

    /** 诱因气候改变 */
    @Excel(name = "诱因气候改变")
    private Integer triggerWeatherChange;

    /** 诱因运动 */
    @Excel(name = "诱因运动")
    private Integer triggerExercise;

    /** 诱因哭闹 */
    @Excel(name = "诱因哭闹")
    private Integer triggerCrying;

    /** 诱因食物 */
    @Excel(name = "诱因食物")
    private Integer triggerFood;

    /** 诱因药物 */
    @Excel(name = "诱因药物")
    private Integer triggerMedication;

    /** 诱因其他 */
    @Excel(name = "诱因其他")
    private Integer triggerOther;

    public void setSymptomId(Long symptomId) 
    {
        this.symptomId = symptomId;
    }

    public Long getSymptomId() 
    {
        return symptomId;
    }

    public void setFollowupId(Long followupId) 
    {
        this.followupId = followupId;
    }

    public Long getFollowupId() 
    {
        return followupId;
    }

    public void setItchyNose(Integer itchyNose) 
    {
        this.itchyNose = itchyNose;
    }

    public Integer getItchyNose() 
    {
        return itchyNose;
    }

    public void setSneezing(Integer sneezing) 
    {
        this.sneezing = sneezing;
    }

    public Integer getSneezing() 
    {
        return sneezing;
    }

    public void setClearDischarge(Integer clearDischarge) 
    {
        this.clearDischarge = clearDischarge;
    }

    public Integer getClearDischarge() 
    {
        return clearDischarge;
    }

    public void setNasalCongestion(Integer nasalCongestion) 
    {
        this.nasalCongestion = nasalCongestion;
    }

    public Integer getNasalCongestion() 
    {
        return nasalCongestion;
    }

    public void setItchyEyes(Integer itchyEyes) 
    {
        this.itchyEyes = itchyEyes;
    }

    public Integer getItchyEyes() 
    {
        return itchyEyes;
    }

    public void setTearing(Integer tearing) 
    {
        this.tearing = tearing;
    }

    public Integer getTearing() 
    {
        return tearing;
    }

    public void setRedEyes(Integer redEyes) 
    {
        this.redEyes = redEyes;
    }

    public Integer getRedEyes() 
    {
        return redEyes;
    }

    public void setEyeBurning(Integer eyeBurning) 
    {
        this.eyeBurning = eyeBurning;
    }

    public Integer getEyeBurning() 
    {
        return eyeBurning;
    }

    public void setItchyThroat(Integer itchyThroat) 
    {
        this.itchyThroat = itchyThroat;
    }

    public Integer getItchyThroat() 
    {
        return itchyThroat;
    }

    public void setFever(Integer fever) 
    {
        this.fever = fever;
    }

    public Integer getFever() 
    {
        return fever;
    }

    public void setMouthBreathing(Integer mouthBreathing) 
    {
        this.mouthBreathing = mouthBreathing;
    }

    public Integer getMouthBreathing() 
    {
        return mouthBreathing;
    }

    public void setSnoring(Integer snoring) 
    {
        this.snoring = snoring;
    }

    public Integer getSnoring() 
    {
        return snoring;
    }

    public void setCough(Integer cough) 
    {
        this.cough = cough;
    }

    public Integer getCough() 
    {
        return cough;
    }

    public void setWheezing(Integer wheezing) 
    {
        this.wheezing = wheezing;
    }

    public Integer getWheezing() 
    {
        return wheezing;
    }

    public void setDyspnea(Integer dyspnea) 
    {
        this.dyspnea = dyspnea;
    }

    public Integer getDyspnea() 
    {
        return dyspnea;
    }

    public void setChestTightness(Integer chestTightness) 
    {
        this.chestTightness = chestTightness;
    }

    public Integer getChestTightness() 
    {
        return chestTightness;
    }

    public void setSighing(Integer sighing) 
    {
        this.sighing = sighing;
    }

    public Integer getSighing() 
    {
        return sighing;
    }

    public void setActivityLimitation(Integer activityLimitation) 
    {
        this.activityLimitation = activityLimitation;
    }

    public Integer getActivityLimitation() 
    {
        return activityLimitation;
    }

    public void setNighttimeAwake(Integer nighttimeAwake) 
    {
        this.nighttimeAwake = nighttimeAwake;
    }

    public Integer getNighttimeAwake() 
    {
        return nighttimeAwake;
    }

    public void setMorningNightWorse(Integer morningNightWorse) 
    {
        this.morningNightWorse = morningNightWorse;
    }

    public Integer getMorningNightWorse() 
    {
        return morningNightWorse;
    }

    public void setRash(Integer rash) 
    {
        this.rash = rash;
    }

    public Integer getRash() 
    {
        return rash;
    }

    public void setItching(Integer itching) 
    {
        this.itching = itching;
    }

    public Integer getItching() 
    {
        return itching;
    }

    public void setPain(Integer pain) 
    {
        this.pain = pain;
    }

    public Integer getPain() 
    {
        return pain;
    }

    public void setSleepDisorder(Integer sleepDisorder) 
    {
        this.sleepDisorder = sleepDisorder;
    }

    public Integer getSleepDisorder() 
    {
        return sleepDisorder;
    }

    public void setSeverity(String severity) 
    {
        this.severity = severity;
    }

    public String getSeverity() 
    {
        return severity;
    }

    public void setFrequencyPattern(String frequencyPattern) 
    {
        this.frequencyPattern = frequencyPattern;
    }

    public String getFrequencyPattern() 
    {
        return frequencyPattern;
    }

    public void setStartDate(Date startDate) 
    {
        this.startDate = startDate;
    }

    public Date getStartDate() 
    {
        return startDate;
    }

    public void setTriggerSmoke(Integer triggerSmoke) 
    {
        this.triggerSmoke = triggerSmoke;
    }

    public Integer getTriggerSmoke() 
    {
        return triggerSmoke;
    }

    public void setTriggerDustMite(Integer triggerDustMite) 
    {
        this.triggerDustMite = triggerDustMite;
    }

    public Integer getTriggerDustMite() 
    {
        return triggerDustMite;
    }

    public void setTriggerPollen(Integer triggerPollen) 
    {
        this.triggerPollen = triggerPollen;
    }

    public Integer getTriggerPollen() 
    {
        return triggerPollen;
    }

    public void setTriggerVirus(Integer triggerVirus) 
    {
        this.triggerVirus = triggerVirus;
    }

    public Integer getTriggerVirus() 
    {
        return triggerVirus;
    }

    public void setTriggerMold(Integer triggerMold) 
    {
        this.triggerMold = triggerMold;
    }

    public Integer getTriggerMold() 
    {
        return triggerMold;
    }

    public void setTriggerColdAir(Integer triggerColdAir) 
    {
        this.triggerColdAir = triggerColdAir;
    }

    public Integer getTriggerColdAir() 
    {
        return triggerColdAir;
    }

    public void setTriggerWeatherChange(Integer triggerWeatherChange) 
    {
        this.triggerWeatherChange = triggerWeatherChange;
    }

    public Integer getTriggerWeatherChange() 
    {
        return triggerWeatherChange;
    }

    public void setTriggerExercise(Integer triggerExercise) 
    {
        this.triggerExercise = triggerExercise;
    }

    public Integer getTriggerExercise() 
    {
        return triggerExercise;
    }

    public void setTriggerCrying(Integer triggerCrying) 
    {
        this.triggerCrying = triggerCrying;
    }

    public Integer getTriggerCrying() 
    {
        return triggerCrying;
    }

    public void setTriggerFood(Integer triggerFood) 
    {
        this.triggerFood = triggerFood;
    }

    public Integer getTriggerFood() 
    {
        return triggerFood;
    }

    public void setTriggerMedication(Integer triggerMedication) 
    {
        this.triggerMedication = triggerMedication;
    }

    public Integer getTriggerMedication() 
    {
        return triggerMedication;
    }

    public void setTriggerOther(Integer triggerOther) 
    {
        this.triggerOther = triggerOther;
    }

    public Integer getTriggerOther() 
    {
        return triggerOther;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("symptomId", getSymptomId())
            .append("followupId", getFollowupId())
            .append("itchyNose", getItchyNose())
            .append("sneezing", getSneezing())
            .append("clearDischarge", getClearDischarge())
            .append("nasalCongestion", getNasalCongestion())
            .append("itchyEyes", getItchyEyes())
            .append("tearing", getTearing())
            .append("redEyes", getRedEyes())
            .append("eyeBurning", getEyeBurning())
            .append("itchyThroat", getItchyThroat())
            .append("fever", getFever())
            .append("mouthBreathing", getMouthBreathing())
            .append("snoring", getSnoring())
            .append("cough", getCough())
            .append("wheezing", getWheezing())
            .append("dyspnea", getDyspnea())
            .append("chestTightness", getChestTightness())
            .append("sighing", getSighing())
            .append("activityLimitation", getActivityLimitation())
            .append("nighttimeAwake", getNighttimeAwake())
            .append("morningNightWorse", getMorningNightWorse())
            .append("rash", getRash())
            .append("itching", getItching())
            .append("pain", getPain())
            .append("sleepDisorder", getSleepDisorder())
            .append("severity", getSeverity())
            .append("frequencyPattern", getFrequencyPattern())
            .append("startDate", getStartDate())
            .append("triggerSmoke", getTriggerSmoke())
            .append("triggerDustMite", getTriggerDustMite())
            .append("triggerPollen", getTriggerPollen())
            .append("triggerVirus", getTriggerVirus())
            .append("triggerMold", getTriggerMold())
            .append("triggerColdAir", getTriggerColdAir())
            .append("triggerWeatherChange", getTriggerWeatherChange())
            .append("triggerExercise", getTriggerExercise())
            .append("triggerCrying", getTriggerCrying())
            .append("triggerFood", getTriggerFood())
            .append("triggerMedication", getTriggerMedication())
            .append("triggerOther", getTriggerOther())
            .toString();
    }
}
