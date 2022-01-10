package com.ruoyi.im.service.impl;

import java.util.List;

import com.alibaba.csp.sentinel.util.IdUtil;
import com.ruoyi.common.core.utils.DateUtils;
import com.ruoyi.common.core.utils.IdUtils;
import com.ruoyi.im.domain.ImAddFriendApply;
import com.ruoyi.im.domain.ImUserFriend;
import com.ruoyi.im.mapper.ImAddFriendApplyMapper;
import com.ruoyi.im.mapper.ImUserFriendMapper;
import com.ruoyi.im.service.IImAddFriendApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 好友申请Service业务层处理
 *
 * @author ruoyi
 * @date 2021-12-11
 */
@Service
public class ImAddFriendApplyServiceImpl implements IImAddFriendApplyService
{
    @Autowired
    private ImAddFriendApplyMapper imAddFriendApplyMapper;

    @Autowired
    private ImUserFriendMapper imUserFriendMapper;

    /**
     * 查询好友申请
     *
     * @param applyId 好友申请主键
     * @return 好友申请
     */
    @Override
    public ImAddFriendApply selectImAddFriendApplyByApplyId(String applyId)
    {
        return imAddFriendApplyMapper.selectImAddFriendApplyByApplyId(applyId);
    }

    /**
     * 查询好友申请列表
     *
     * @param imAddFriendApply 好友申请
     * @return 好友申请
     */
    @Override
    public List<ImAddFriendApply> selectImAddFriendApplyList(ImAddFriendApply imAddFriendApply)
    {
        return imAddFriendApplyMapper.selectImAddFriendApplyList(imAddFriendApply);
    }

    @Override
    public List<ImAddFriendApply> selectImAddFriendApplyListByResUserId(String resUserId)
    {
        return imAddFriendApplyMapper.selectImAddFriendApplyListByResUserId(resUserId);
    }

    /**
     * 新增好友申请
     *
     * @param imAddFriendApply 好友申请
     * @return 结果
     */
    @Override
    public int insertImAddFriendApply(ImAddFriendApply imAddFriendApply)
    {
        imAddFriendApply.setCreateTime(DateUtils.getNowDate());
        imAddFriendApply.setApplyId(IdUtils.fastSimpleUUID());
        return imAddFriendApplyMapper.insertImAddFriendApply(imAddFriendApply);
    }

    /**
     * 修改好友申请
     *
     * @param imAddFriendApply 好友申请
     * @return 结果
     */
    @Override
    public int updateImAddFriendApply(ImAddFriendApply imAddFriendApply)
    {
        imAddFriendApply.setUpdateTime(DateUtils.getNowDate());
        return imAddFriendApplyMapper.updateImAddFriendApply(imAddFriendApply);
    }

    /**
     * 批量删除好友申请
     *
     * @param applyIds 需要删除的好友申请主键
     * @return 结果
     */
    @Override
    public int deleteImAddFriendApplyByApplyIds(String[] applyIds)
    {
        return imAddFriendApplyMapper.deleteImAddFriendApplyByApplyIds(applyIds);
    }

    /**
     * 删除好友申请信息
     *
     * @param applyId 好友申请主键
     * @return 结果
     */
    @Override
    public int deleteImAddFriendApplyByApplyId(String applyId)
    {
        return imAddFriendApplyMapper.deleteImAddFriendApplyByApplyId(applyId);
    }

    @Override
    @Transactional
    public int finishAddFriend(ImAddFriendApply imAddFriendApply) {

        ImAddFriendApply imAddInfo = imAddFriendApplyMapper.selectImAddFriendApplyByApplyId(imAddFriendApply.getApplyId());
        // 向好友列表更新两条数据
        ImUserFriend req = new ImUserFriend();
        req.setRelationId(IdUtils.fastSimpleUUID());
        req.setUserId(imAddInfo.getReqUserId());
        req.setFriendId(imAddInfo.getResUserId());
        req.setOrigin("1");
        req.setRemarkContent(imAddInfo.getRemarkContent());
        imUserFriendMapper.insertImUserFriend(req);
        req.setRelationId(IdUtils.fastSimpleUUID());
        req.setUserId(imAddInfo.getResUserId());
        req.setFriendId(imAddInfo.getReqUserId());
        req.setOrigin("1");
        req.setRemarkContent(imAddInfo.getMyRemarkContent());
        imUserFriendMapper.insertImUserFriend(req);

        // 修改申请状态
        return imAddFriendApplyMapper.updateImAddFriendApply(imAddFriendApply);
    }
}