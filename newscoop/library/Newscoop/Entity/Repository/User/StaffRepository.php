<?php
/**
 * @package Newscoop
 * @copyright 2011 Sourcefabric o.p.s.
 * @license http://www.gnu.org/licenses/gpl.txt
 */

namespace Newscoop\Entity\Repository\User;

use Newscoop\Entity\User\Staff,
    Newscoop\Entity\Acl\Role,
    Newscoop\Entity\Repository\UserRepository;

/**
 * Staff repository
 */
class StaffRepository extends UserRepository
{
    /**
     * Save staff
     *
     * @param Newscoop\Entity\User\Staff $staff
     * @param array $values
     * @return void
     */
    public function save(Staff $staff, array $values)
    {
        $em = $this->getEntityManager();

        // set groups
        $groups = $staff->getGroups();
        $groups->clear();
        if (!empty($values['groups'])) {
            foreach ($values['groups'] as $groupId) {
                $group = $em->getReference('Newscoop\Entity\User\Group', (int) $groupId);
                $groups->add($group);
            }
        }

        // set username/password
        if ($staff->getId() == NULL) { // add
            $role = new Role;
            $em->persist($role);
            $user->setUsername($values['username'])
                ->setPassword($values['password'])
                ->setRole($role);
        }

        parent::save($staff, $values);
    }
}
