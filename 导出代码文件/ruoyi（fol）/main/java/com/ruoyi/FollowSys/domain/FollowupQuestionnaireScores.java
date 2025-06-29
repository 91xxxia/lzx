package com.ruoyi.FollowSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 调查问卷对象 followup_questionnaire_scores
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class FollowupQuestionnaireScores extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 问卷号 */
    private Long questionnaireId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 评分时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "评分时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date scoreDate;

    /** ACT */
    @Excel(name = "ACT")
    private Long actScore;

    /** C-ACT */
    @Excel(name = "C-ACT")
    private Long cActScore;

    /** TRACK */
    @Excel(name = "TRACK")
    private Long trackScore;

    /** 症状药物评分 */
    @Excel(name = "症状药物评分")
    private Long symptomMedicationScore;

    /** 儿童皮肤病治疗指数 */
    @Excel(name = "儿童皮肤病治疗指数")
    private Long cdlqiScore;

    /** 儿童皮炎评分 */
    @Excel(name = "儿童皮炎评分")
    private Long scoardScore;

    /** 婴儿皮肤病生活指数 */
    @Excel(name = "婴儿皮肤病生活指数")
    private Long idqolScore;

    /** 鼻炎VSA评分 */
    @Excel(name = "鼻炎VSA评分")
    private Long rhinitisVasScore;

    public void setQuestionnaireId(Long questionnaireId) 
    {
        this.questionnaireId = questionnaireId;
    }

    public Long getQuestionnaireId() 
    {
        return questionnaireId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setScoreDate(Date scoreDate) 
    {
        this.scoreDate = scoreDate;
    }

    public Date getScoreDate() 
    {
        return scoreDate;
    }

    public void setActScore(Long actScore) 
    {
        this.actScore = actScore;
    }

    public Long getActScore() 
    {
        return actScore;
    }

    public void setcActScore(Long cActScore) 
    {
        this.cActScore = cActScore;
    }

    public Long getcActScore() 
    {
        return cActScore;
    }

    public void setTrackScore(Long trackScore) 
    {
        this.trackScore = trackScore;
    }

    public Long getTrackScore() 
    {
        return trackScore;
    }

    public void setSymptomMedicationScore(Long symptomMedicationScore) 
    {
        this.symptomMedicationScore = symptomMedicationScore;
    }

    public Long getSymptomMedicationScore() 
    {
        return symptomMedicationScore;
    }

    public void setCdlqiScore(Long cdlqiScore) 
    {
        this.cdlqiScore = cdlqiScore;
    }

    public Long getCdlqiScore() 
    {
        return cdlqiScore;
    }

    public void setScoardScore(Long scoardScore) 
    {
        this.scoardScore = scoardScore;
    }

    public Long getScoardScore() 
    {
        return scoardScore;
    }

    public void setIdqolScore(Long idqolScore) 
    {
        this.idqolScore = idqolScore;
    }

    public Long getIdqolScore() 
    {
        return idqolScore;
    }

    public void setRhinitisVasScore(Long rhinitisVasScore) 
    {
        this.rhinitisVasScore = rhinitisVasScore;
    }

    public Long getRhinitisVasScore() 
    {
        return rhinitisVasScore;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("questionnaireId", getQuestionnaireId())
            .append("patientId", getPatientId())
            .append("scoreDate", getScoreDate())
            .append("actScore", getActScore())
            .append("cActScore", getcActScore())
            .append("trackScore", getTrackScore())
            .append("symptomMedicationScore", getSymptomMedicationScore())
            .append("cdlqiScore", getCdlqiScore())
            .append("scoardScore", getScoardScore())
            .append("idqolScore", getIdqolScore())
            .append("rhinitisVasScore", getRhinitisVasScore())
            .toString();
    }
}
